using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using eProject.Models;
namespace eProject.ViewModel
{
    public class UserWinnerAuction //lop trung gian noi 3 bang User, Auction, Winner
    {
        public User User { get; set; }
        public Auction Auction { get; set; }
        public Winner Winner { get; set; }
    }
}