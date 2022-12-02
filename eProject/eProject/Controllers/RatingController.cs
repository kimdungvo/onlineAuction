using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using eProject.Models;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;
using eProject.ViewModel;
using eProject.Repository;

namespace eProject.Controllers
{
    public class RatingController : Controller
    {
        private Data.DatabaseContext db;

        public RatingController(Data.DatabaseContext db)
        {
            this.db = db;
        }

        //buyer create rate star + comment
        [HttpGet]
        public IActionResult Create(int id)
        {
            ViewBag.AuctionId = id;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Rating rating)
        {
            var user = JsonConvert.DeserializeObject<User>(HttpContext.Session.GetString("acc"));
            //lay het du lieu bang Auction voi dieu kien AuctionId cua bang Auction = AuctionId cua bang Rating(lay ra AuctionId muon tao rating)
            var auction = db.Auctions.Find(rating.AuctionId);

            var comment = rating.Comment;
            var star = rating.Star;

            //lay het ds Winner voi dieu kien AuctionId cua bang Winners = AuctionId cua bang Auction(lay ds Winners theo AuctionId)
            var win = db.Winners.Where(x => x.AuctionId.Equals(auction.AuctionId));

            //lay ra ten Winner voi dieu kien WinnerId cua bang Winners = UserId cua Session user dang nhap(nguoi login la nguoi chien thang AutionId cua Seller)
            var buyer = win.Where(y => y.WinnerId.Equals(user.UserId)).SingleOrDefault();

            if (auction.EndDate < DateTime.Now)// neu AUCTION EXPIRED
            {
                if (buyer != null)//neu user dang nhap la user chien thang dau gia AuctionId dang xet
                {
                    var rate = db.Ratings.SingleOrDefault(x => x.AuctionId.Equals(auction.AuctionId) && x.ReviewerId.Equals(buyer.WinnerId));
                    if (rate == null)//neu winner chua rate + comment
                    {
                        //filter comment
                        List<string> s = new List<string> { "ass", "jerk", "idiot", "damn it", "scoundrel", "dog", "god damned", "uppy", "dirty pig", "fuck", "shut up", "crazy", "get lost", "Drop dead" };
                        foreach (var item in s)
                        {
                            if (comment.Contains(item.ToLower()))
                            {
                                comment = comment.Replace(item, "Comment is hidden because of containing swear-words");
                            }
                        }

                        Rating ra = new Rating()
                        {
                            AuctionId = auction.AuctionId,
                            Comment = comment,
                            Star = star,
                            CreateAt = DateTime.Now,
                            ReviewerId = buyer.WinnerId,//nguoi chien thang dau thau AuctionId cua Seller 
                            ReceiverId = auction.UserId//nguoi tao AuctionId
                        };

                        db.Ratings.Add(ra);
                        db.SaveChanges();
                        //TempData["Message"] = "You have reviewed successfully! But some comments that contains swear-words won't be displayed";                
                        return RedirectToAction("Index", "ProfileSeller", new { id = auction.UserId });
                    }
                    else
                    {
                        TempData["Message"] = "Sorry! You reviewed this Auction";
                        return RedirectToAction("Create", "Rating", new { id = rating.AuctionId });
                    }
                }
                else
                {
                    TempData["Message"] = "Sorry! You can't review because you aren't winner of this auction or you aren't user that created Auction";
                    return RedirectToAction("Create", "Rating", new { id = rating.AuctionId });
                }
            }
            else
            {
                TempData["Message"] = "Sorry! You can't review bidding products";
                return RedirectToAction("Create", "Rating", new { id = rating.AuctionId });
            }
        }

        // Seller create rate star + comment
        [HttpGet]
        public IActionResult SellerCreate(int id)
        {
            ViewBag.AuctionId = id;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SellerCreate(Rating rating)
        {
            var user = JsonConvert.DeserializeObject<User>(HttpContext.Session.GetString("acc"));
            //lay het du lieu bang Auction voi dieu kien AuctionId cua bang Auction = AuctionId cua bang Rating
            var auction = db.Auctions.Find(rating.AuctionId);

            var comment = rating.Comment;
            var star = rating.Star;

            //lay het ds Winner voi dieu kien AuctionId cua bang Winners = AuctionId cua bang Auction(lay ds Winners theo AuctionId)
            //var win = db.Winners.Where(x => x.AuctionId.Equals(auction.AuctionId)).SingleOrDefault();

            //lay ra ten Winner voi dieu kien WinnerId cua bang Winners = UserId cua Session user dang nhap(nguoi login la nguoi chien thang AutionId cua Seller)
            //var buyer = win.Where(y => y.WinnerId.Equals(user.UserId)).SingleOrDefault();

            var buyer = db.AuctionBids.Where(x => x.AuctionId.Equals(auction.AuctionId)).SingleOrDefault();

            if (auction.EndDate < DateTime.Now)// neu AUCTION EXPIRED
            {
                if (user.UserId == auction.UserId)//neu user dang nhap la seller
                {
                    //filter comment
                    List<string> s = new List<string> { "ass", "jerk", "idiot", "damn it", "scoundrel", "dog", "god damned", "uppy", "dirty pig", "fuck", "shut up", "crazy", "get lost", "Drop dead" };
                    foreach (var item in s)
                    {
                        if (comment.Contains(item.ToLower()))
                        {
                            comment = comment.Replace(item, "Comment is hidden because of containing swear-words");
                        }
                    }

                    Rating ra = new Rating()
                    {
                        AuctionId = auction.AuctionId,
                        Comment = comment,
                        Star = 0,
                        CreateAt = DateTime.Now,
                        ReviewerId = auction.UserId,//nguoi tao AuctionId
                        ReceiverId = auction.UserId//nguoi tham gia dau thau AuctionId cua Seller
                    };

                    db.Ratings.Add(ra);
                    db.SaveChanges();
                    //TempData["Message"] = "You have reviewed successfully! But some comments that contains swear-words won't be displayed";                
                    return RedirectToAction("Index", "ProfileSeller", new { id = auction.UserId });
                }

                else
                {
                    TempData["Message"] = "Sorry! You can't review because you aren't winner of this auction or you aren't user that created Auction";
                    return RedirectToAction("SellerCreate", "Rating", new { id = rating.AuctionId });
                }
            }
            else
            {
                TempData["Message"] = "Sorry! You can't review bidding products";
                return RedirectToAction("SellerCreate", "Rating", new { id = rating.AuctionId });
            }
        }
    }
}