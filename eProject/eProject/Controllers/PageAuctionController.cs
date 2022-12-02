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
using Microsoft.AspNetCore.Mvc.Rendering;
using eProject.ViewModel;
using X.PagedList.Mvc;
using X.PagedList;

namespace eProject.Controllers
{
    public class PageAuctionController : Controller
    {
        private ILog log = LogManager.GetLogger("HomeController");

        public Stream InputStream { get; private set; }
        private readonly Data.DatabaseContext db;
        private readonly IAuctionServices serviceAuction;
        private readonly ICategoryServices serviceCat;
        private readonly IAuctionBid serviceBid;
        private readonly IUserServices serviceUser;
       
        private readonly IWinner serviceWin;

        public PageAuctionController(Data.DatabaseContext db,IAuctionServices serviceAuction, ICategoryServices serviceCat, IAuctionBid serviceBid, IUserServices serviceUser, IWinner serviceWin)
        {
            this.db = db;
            this.serviceAuction = serviceAuction;
            this.serviceCat = serviceCat;
            this.serviceBid = serviceBid;
            this.serviceUser = serviceUser; 
            this.serviceWin = serviceWin;

        }
        public IActionResult Index(string searchName, int? page)
        {
            var model = serviceAuction.ListAuctions();
            ViewBag.Category = serviceCat.GetCategories();            
            if (searchName != null)
            {
                model = model.Where(x => x.Auction.Title.ToLower().Contains(searchName.ToLower())).ToList();
                return View(model.OrderByDescending(x => x.Auction.AuctionId).ToPagedList(page ?? 1, 9));
            }
            return View(model.OrderByDescending(x => x.Auction.AuctionId).ToPagedList(page ?? 1, 9));
        }
        public IActionResult SearchCat(int CatId, int? page)
        {            
            ViewBag.Category = serviceCat.GetCategories();           
            var  model = serviceAuction.ListAuctions().Where(x =>x.Auction.CategoryId.Equals(CatId)).ToList().ToPagedList(page ?? 1, 9);           
            return View("~/Views/PageAuction/Index.cshtml",model);            
        }
        public IActionResult SearchCondition(string cd, int? page)
        {
            ViewBag.Category = serviceCat.GetCategories();
            var model = serviceAuction.ListAuctions().Where(x =>x.Auction.Condition.Equals(cd)).ToList();           
            return View("~/Views/PageAuction/Index.cshtml", model.ToPagedList(page ?? 1,9));
        }
        public IActionResult OrderPrice(string order, int? page)
        {
            ViewBag.Category = serviceCat.GetCategories();
            var model = serviceAuction.ListAuctions();
            if (order=="high")
            {
                model = model.OrderByDescending(x => x.Auction.SalePrice).ToList();
            }
            else if (order == "low"){
                model = model.OrderBy(x => x.Auction.SalePrice).ToList();
            }
            
            return View("~/Views/PageAuction/Index.cshtml", model.ToPagedList(page ?? 1, 9));
        }
        public IActionResult Details(int id)
        {
            var model = serviceAuction.DetailsAuction(id);
            ViewBag.Relative = serviceAuction.GetAuctions().Where(x => x.Auction.CategoryId.Equals(model.Auction.CategoryId));
            if (model==null)
            {
                ViewData["error"] = "This auction does not exist";
                return View("~/Views/Shared/Error2.cshtml");
            }
            var bid = serviceBid.GetBids(id);            
            //If there are bidders, find the highest bidder and update the winner table if that auction has ended (this condition is set in folder service)
            if (bid != null)
            {
                var max = bid.Select(x => x.BidAmount).DefaultIfEmpty(0).Max();
                var bidmax = bid.Where(x => x.BidAmount == max).SingleOrDefault();
                if (model.Auction.EndDate < DateTime.Now && bidmax!=null)
                {
                    ViewBag.Winner = serviceUser.GetUser(bidmax.UserId);
                    serviceAuction.InactiveAuction(id);
                    serviceWin.UpdateWinner(id, bidmax.UserId);
                   ViewBag.pay= serviceWin.findWin(id);
                }                                              
            }                                     
            ViewBag.Buyer = serviceUser.GetUsers();
            var userId = model.Auction.UserId;
            var stars = db.Ratings.Where(d => d.ReceiverId.Equals(userId)).ToList();
            if (stars.Count() > 0)
            {
                ViewBag.RatingAvg = stars.Average(d => d.Star);
                ViewBag.RatingCount = stars.Count();              
            }
            else
            {
                ViewBag.RatingAvg = 0;
                ViewBag.RatingCount = 0;
            }            
            //ViewBag.user = serviceUser.GetUsers();//nguoi review
            ViewBag.Bid = bid;
            //check out
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
                    Name =model.Auction.Title,
                    Description =model.Auction.Description,
                    Amount =model.Auction.SalePrice*100,
                    Currency = "usd",
                    Quantity = 1,
                    // Product Images
                    Images = new List<string>
                    {
                        HttpUtility.UrlPathEncode("https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/.NET_Core_Logo.svg/1200px-.NET_Core_Logo.svg.png"),

                        HttpUtility.UrlPathEncode("https://miro.medium.com/max/2728/1*MfOHvI5b1XZKYTXIAKY7PQ.png")
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
            HttpContext.Session.SetString("auction", JsonConvert.SerializeObject(model.Auction));
            var service = new SessionService();
            Session session = service.Create(options);
            ViewBag.Checkout = session;
            return View(model);
        }
        //Report    
        [HttpGet]
        public IActionResult AddReport(int id)
        {
            var model = serviceWin.AuctionWin(id);           
            return View(model);
        }
        [HttpPost]
        public IActionResult AddReport(int auctionid, int winnerid, string report)
        {
            try
            {
                //tim doi tuong wi trong bang Winners co WinnerId trung khop voi winner dang xet o trang DetailAuction
                var wi = db.Winners.SingleOrDefault(x => x.WinnerId.Equals(winnerid));
                if (wi != null)//neu tim thay
                {
                    if (wi.Report == null)
                    {
                        wi.Report = report;//cap nhat cot Report
                        db.SaveChanges();//cap nhat lai DB
                        TempData["message"] = "Report successfully !";
                    }
                    else
                    {
                        TempData["message"] = "You have already reported this auction !";
                    }
                }
            }
            catch (Exception e)
            {
                TempData["message"] = e.Message;
            }
            var model = serviceWin.AuctionWin(auctionid);
            return View(model);
        }
    }
}
