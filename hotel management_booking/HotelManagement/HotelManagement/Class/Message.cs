public class Message
{
    //connection string
    internal const string ConnectionString = @"Data Source=localhost;Initial Catalog=DavidDucHotel;User ID=sa;Password=123456";
    internal const string ConfirmSave = "Are you sure that you want to save?";
    internal const string ConfirmDelete = "Are you sure that you want to delete?";
    internal const string ourEmail = "tungda01659@gmail.com";
    internal const string ourEmailPass = "buiphuong";
    internal const string targetEmail = "tungda01659@fpt.edu.vn";
    //table
    internal const string CustomerTable = "Customer";
    internal const string RoomTable = "Room";
    internal const string FurnitureTable = "Furniture";
    internal const string FurnitureTypeTable = "FurnitureType";
    internal const string BuildingTypeTable = "BuildingType";
    internal const string UserAccountTable = "UserAccount";
    internal const string BannerPicture = "BannerPicture";
    internal const string MenuBar = "MenuBar";
    internal const string NewsTable = "News";
    internal const string Stuff = "Stuff";
    internal const string BuildingTable = "Building";
    internal const string FurnitureHistory = "FurnitureHistory";
    internal const string RequestID = "RequestID";
    internal const string RequestUser = "RequestUser";
    internal const string RequestFurniture = "RequestFurniture";
    internal const string Comment = "Comment";

    //CustomerTable column
    internal const string CustomerID = "CustomerID";
    internal const string FirstName = "FirstName";
    internal const string MiddleName = "MiddleName";
    internal const string LastName = "LastName";
    internal const string Gender = "Gender";
    internal const string PhoneNumber = "PhoneNumber";
    internal const string LastCheckIn = "LastCheckIn";
    internal const string LastCheckOut = "LastCheckOut";
    internal const string LastStay = "LastStay";
    internal const string LastRoom = "LastRoomID";
    internal const string CheckIn = "CheckInDate";
    internal const string CheckOut = "CheckOutDate";
    internal const string Email = "Email";
    internal const string Stay = "Stay";
    internal const string Discount = "Discount";
    internal const string Prepaid = "Prepaid";
    internal const string Remain = "Remain";
    internal const string Total = "Total";
    internal const string Reason = "Reason";

    //RoomTable column
    internal const string RoomID = "RoomID";
    internal const string BuildingID = "BuildingID";
    internal const string BuildingTypeID = "BuildingTypeID";
    internal const string RoomNo = "RoomNo";
    internal const string CurrentCustomer = "CurrentCustomerID";
    internal const string Floor = "Floor";
    internal const string Address = "Address";
    internal const string Price = "Price";
    internal const string Garage = "Garage";
    internal const string Pool = "Pool";
    internal const string Garden = "Garden";
    internal const string BedRoom = "BedRoom";
    internal const string BathRoom = "BathRoom";
    internal const string Description = "Description";
    internal const string Area = "Area";
    internal const string Picture = "Picture";
    internal const string Furniture = "Furniture";
    internal const string RentTime = "RentTime";
    internal const string District = "District";
    internal const string IsWarehouse = "IsWarehouse";
    internal const string Coordinates = "Coordinates";
    internal const string NumberFloor = "NumberFloor";

    //FurnitureTable column
    internal const string FurnitureID = "FurnitureID";
    internal const string CurrentRoom = "CurrentRoomID";
    internal const string CurrentBuilding = "CurrentBuildingID";
    internal const string FurnitureType = "FurnitureTypeID";
    internal const string Name = "Name";
    internal const string MadeIn = "MadeIn";
    internal const string StartWarranty = "StartWarranty";
    internal const string EndWarranty = "EndWarranty";
    internal const string HandoverID = "HandoverID";
    internal const string CollectionID = "CollectionID";
    internal const string NumberInCollection = "NumberInCollection";
    internal const string ApproveDelete = "ApproveDelete";
    internal const string TargetRoomID = "TargetRoomID";
    internal const string ApproveMove = "ApproveMove";
    internal const string MovingHistory = "MovingHistory";

    //UserAccountTable column
    internal const string UserID = "UserID";
    internal const string UserLevel = "UserLevel";
    internal const string UserName = "UserName";
    internal const string Password = "Password";
    internal const string FullName = "FullName";
    internal const string RoomManage = "BuildingManage";
    internal const string Status = "Status";

    //Menubar table column
    internal const string Title = "Title";
    internal const string Link = "Link";
    internal const string MenuLevel = "MenuLevel";
    internal const string ParentID = "ParentID";
    internal const string AppearNo = "AppearNo";
    internal const string MenuID = "MenuID";

    //NewsTable column
    internal const string NewsID = "NewsID";
    internal const string Date = "Date";
    internal const string NewsContent = "NewsContent";
    internal const string Poster = "Poster";

    //StuffTable column
    internal const string StuffID = "StuffID";
    internal const string StuffContent = "StuffContent";
    internal const string Available = "Available";
}