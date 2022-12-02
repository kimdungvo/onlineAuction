using eProject.Models;
using eProject.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProject.Repository
{
   public interface IAuctionServices
    {
        List<CatAuctionUser> GetAuctions();
        List<CatAuctionUser> ListAuctions();
        void CreateAuction(Auction auction);
        void UpdateAuction(Auction auction);
        CatAuctionUser DetailsAuction(int id);
        Auction findOne(int id);
        bool DeleteAuction(int id);      
        bool ActiveAuction(int id);
        bool InactiveAuction(int id);
        bool LockAuction(int id);
        void UpdateSalePrice(Auction auction);

        IEnumerable<CatAuctionUser> getProductAll();
        int totalProduct();
        int numberPage(int totalProduct, int limit);
        IEnumerable<Auction> paginationProduct(int start, int limit);


        List<CatAuctionUser> GetAuctionUser(int id);
       
    }
}
