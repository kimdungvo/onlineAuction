using eProject.Repository;
using eProject.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ReportController : Controller
    {
        private Data.DatabaseContext db;
        private readonly IWinner serviceWin;
        public ReportController(Data.DatabaseContext db, IWinner serviceWin)
        {
            this.db = db;
            this.serviceWin = serviceWin;
        }

        public IActionResult Index()
        {
            //noi 3 table Auction & User & Winner
            var result = from a in db.Auctions
                         join b in db.Winners on a.AuctionId equals b.AuctionId
                         join c in db.Users on b.WinnerId equals c.UserId
                         select new UserWinnerAuction
                         {
                             Auction = a,
                             Winner = b,
                             User = c
                         };
            return View(result.ToList());
        }

        public IActionResult Details(int id)
        {
            var result = from a in db.Auctions
                         join b in db.Winners on a.AuctionId equals b.AuctionId
                         join c in db.Users on b.WinnerId equals c.UserId
                         where a.AuctionId == id
                         select new UserWinnerAuction
                         {
                             Auction = a,
                             Winner = b,
                             User = c
                         };
            return View(result.SingleOrDefault());
        }
    }
}