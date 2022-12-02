using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Stripe;
using Stripe.Checkout;
using System.IO;

using log4net;

using System.Web;
using eProject.Models;
using eProject.Repository;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using MimeKit;

namespace eProject.Controllers
{
    public class CheckoutController : Controller
    {
        private ILog log = LogManager.GetLogger("HomeController");

        public Stream InputStream { get; private set; }
       
        private readonly IWinner serviceWin;
       
        private readonly IUserServices serviceUser;
        private Data.DatabaseContext db;

        public CheckoutController(IWinner serviceWin, IUserServices serviceUser, Data.DatabaseContext _db)
        {           

            this.serviceWin = serviceWin;
            db = _db;          
            this.serviceUser = serviceUser;
        }
        
        public IActionResult Index()
        {
            var auc = JsonConvert.DeserializeObject<Auction>(HttpContext.Session.GetString("auction"));

            //var auction = serviceAu.findOne(id);
            //HttpContext.Session.SetString("auction", JsonConvert.SerializeObject(auction));
            // Set your secret key: remember to change this to your live secret key in production
            // See your keys here: https://dashboard.stripe.com/account/apikeys
            StripeConfiguration.ApiKey = "sk_test_51KFFdMBgF6PMJrwmXm7MRrAXg55KQcY66YJq0knyrmjBise7O6lQsQhuL1Me2UXmWfAwyvrBblvuJ7zNDcBAYLAq00ii3gVt2P";

            var options = new SessionCreateOptions
            {
                PaymentMethodTypes = new List<string> {
                "card",
            },
                LineItems = new List<SessionLineItemOptions>
            {
                // products
                new SessionLineItemOptions {
                    Name = auc.Title /*auction.Title*/,
                    Description = auc.Description /*auction.Description*/,
                    Amount = auc.SalePrice /*auction.SalePrice*/,
                    Currency = "usd",
                    Quantity = 1,
                    // Product Images
                    Images = new List<string>
                    {
                        auc.Image
                    } 
                }
            },
                SuccessUrl = "http://localhost:21227/Checkout/Thanks", // Your website, Stripe will redirect to this URL
                CancelUrl = "http://localhost:21227/cancel", // Your websute, If user cancel payment, Stripe will redirect to this URL
                // Your configurations
                PaymentIntentData = new SessionPaymentIntentDataOptions
                {
                    // Maybe is Order ID, Customer ID, Descriptions,...
                    Metadata = new Dictionary<string, string>
                    {
                        // For example: Order ID, Description
                        { "Order_ID", "123456" }, // Order ID in your database
                        { "Description", "Comfortable cotton t-shirt - TD Shop - 2019" }
                    }
                }
            };

            var service = new SessionService();
            Session session = service.Create(options);
            return View(session);
        }

        public void sendMail()
        {
            var auc = JsonConvert.DeserializeObject<Auction>(HttpContext.Session.GetString("auction"));


            var win = db.Winners.SingleOrDefault(x => x.AuctionId.Equals(auc.AuctionId));
            var winner = db.Users.Find(win.WinnerId);

            var email = new MimeMessage();
            email.Sender = MailboxAddress.Parse("thinhphanlhc@gmail.com");
            email.To.Add(MailboxAddress.Parse(winner.Email));

            string FilePath = "./Views/Checkout/ConfirmTemplate.cshtml";
            StreamReader str = new StreamReader(FilePath);
            string MailText = str.ReadToEnd();
            str.Close();

            //MailText = MailText.Replace("[newusername]", email.Sender.ToString());
            MailText = MailText.Replace("[title]", auc.Title);
            MailText = MailText.Replace("[price]", auc.SalePrice.ToString());
            MailText = MailText.Replace("[img]", "http://localhost:21227/images/h1.jpg"); 


            email.Subject = "Online Auction Confirm Payment";
            var builder = new BodyBuilder();
            builder.HtmlBody = MailText;
            email.Body = builder.ToMessageBody();
            MailKit.Net.Smtp.SmtpClient smtp = new MailKit.Net.Smtp.SmtpClient();
            smtp.Connect("smtp.gmail.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
            smtp.Authenticate("thinhphanlhc@gmail.com", "Phucthinh7415");
            smtp.SendAsync(email);
        }

        public void sendMailToSeller()
        {
            var auc = JsonConvert.DeserializeObject<Auction>(HttpContext.Session.GetString("auction"));


            var win = db.Winners.SingleOrDefault(x => x.AuctionId.Equals(auc.AuctionId)).IsCheckOut;

            var email = new MimeMessage();
            email.Sender = MailboxAddress.Parse("thinhphanlhc@gmail.com");
            if (win == true)
            {
                var seller = db.Users.Find(auc.UserId).Email;
                email.To.Add(MailboxAddress.Parse(seller));
            }

            string FilePath = "./Views/Checkout/ConfirmSeller.cshtml";
            StreamReader str = new StreamReader(FilePath);
            string MailText = str.ReadToEnd();
            str.Close();

            //MailText = MailText.Replace("[newusername]", email.Sender.ToString());
            MailText = MailText.Replace("[ordID]", auc.AuctionId.ToString());
            MailText = MailText.Replace("[title]", auc.Title);
            MailText = MailText.Replace("[price]", auc.SalePrice.ToString());


            email.Subject = "Online Auction Confirm Payment";
            var builder = new BodyBuilder();
            builder.HtmlBody = MailText;
            email.Body = builder.ToMessageBody();
            MailKit.Net.Smtp.SmtpClient smtp = new MailKit.Net.Smtp.SmtpClient();
            smtp.Connect("smtp.gmail.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
            smtp.Authenticate("thinhphanlhc@gmail.com", "Phucthinh7415");
            smtp.SendAsync(email);
        }

        public ActionResult Thanks()
        {
            var auction = JsonConvert.DeserializeObject<Auction>(HttpContext.Session.GetString("auction"));
            var Seller = serviceUser.GetUser(auction.UserId);
            //cap nhat da checkout
            serviceWin.IsCheckOut(auction.AuctionId);
            sendMail();
            sendMailToSeller();
            HttpContext.Session.Remove("auction");
            return View();
        }


    }
}
