using eProject.Repository;
using eProject.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProject.Controllers
{
    public class ProfileSellerController : Controller
    {
        private Data.DatabaseContext db;
        private readonly IUserServices serviceUser;
       
        private readonly IAuctionBid serviceBid;
        private readonly IAuctionServices serviceAuction;
        public ProfileSellerController(Data.DatabaseContext db, IUserServices serviceUser, IAuctionBid serviceBid, IAuctionServices serviceAuction)
        {
            this.db = db;
            this.serviceUser = serviceUser;            
            this.serviceBid = serviceBid;
            this.serviceAuction = serviceAuction;
        }
        public IActionResult Index(int id)
        {
            ViewBag.User = serviceUser.GetUser(id);//hien thi user theo UserId (seller) dang xet

            var rating = db.Ratings.Where(d => d.ReceiverId.Equals(id)).ToList();
            ViewBag.positive = rating.Where(x => x.Star >= 7).Count();
            ViewBag.neutral = rating.Where(x => x.Star < 7 && x.Star >= 5).Count();
            ViewBag.negative = rating.Where(x => x.Star < 5).Count();

            //noi 3 table Auction & User & Rating
            var result = from a in db.Users
                         join b in db.Auctions on a.UserId equals b.UserId //seller = receiver
                         join c in db.Ratings on b.AuctionId equals c.AuctionId
                         join d in db.Users on c.ReviewerId equals d.UserId //buyer = reviewer
                         where b.UserId == id // chi hien thi Rating cua Buyer theo SellerId dang xet 
                         select new RatingViewModel
                         {
                             Receiver = a,
                             Auction = b,
                             Rating = c,
                             Reviewer = d
                         };


            var stars = result;
            if (stars.Count() > 0)
            {
                ViewBag.RatingAvg = stars.Average(d => d.Rating.Star);
                ViewBag.RatingCount = stars.Count();
            }
            else
            {
                ViewBag.RatingAvg = 0;
                ViewBag.RatingCount = 0;
            }
            return View(result.ToList());
        }
    }
}