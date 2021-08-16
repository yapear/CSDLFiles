namespace ESPM;

using com.sample from './Employees';

entity Customer
{
    key CustomerId : String(36);
    City : String(40);
    Country : String(3);
    DateOfBirth : Timestamp not null;
    EmailAddress : String(255);
    FirstName : String(40);
    HouseNumber : String(10);
    LastName : String(40);
    PhoneNumber : String(30);
    PostalCode : String(10);
    Street : String(60);
    UpdatedTimestamp : Timestamp;
    SalesOrders : Composition of many SalesOrderHeader on SalesOrders.CustomerDetails = $self;
}

entity Product
{
    key ProductId : String(36);
    Category : String(40);
    CategoryName : String(40);
    CurrencyCode : String(5);
    DimensionDepth : Decimal(13,4);
    DimensionHeight : Decimal(13,4);
    DimensionUnit : String(3);
    DimensionWidth : Decimal(13,4);
    LongDescription : String(255);
    Name : String;
    PictureUrl : String(255);
    Price : Decimal(23,3);
    QuantityUnit : String(3);
    ShortDescription : String(255);
    SupplierId : String(36) not null;
    UpdatedTimestamp : Timestamp;
    Weight : Decimal(13,3);
    WeightUnit : String(3);
    StockDetails : Composition of one Stock on StockDetails.ProductDetails = $self;
    SupplierDetails : Association to one Supplier on SupplierDetails.SupplierId = $self.SupplierId;
}

entity ProductCategory
{
    key Category : String(40);
    CategoryName : String(40);
    MainCategory : String(40);
    MainCategoryName : String(40);
    NumberOfProducts : Integer64;
    UpdatedTimestamp : Timestamp;
}

entity ProductText
{
    key Id : Integer64;
    Language : String(2);
    LongDescription : String(255);
    Name : String;
    ProductId : String(36) not null;
    ShortDescription : String(255);
}

entity PurchaseOrderHeader
{
    key PurchaseOrderId : String(36);
    CurrencyCode : String(5);
    GrossAmount : Decimal(15,3);
    NetAmount : Decimal(15,3);
    SupplierId : String(36) not null;
    TaxAmount : Decimal(15,3);
    Items : Composition of many PurchaseOrderItem on Items.Header = $self;
    SupplierDetails : Association to one Supplier on SupplierDetails.SupplierId = $self.SupplierId;
}

entity PurchaseOrderItem
{
    key ItemNumber : Integer;
    key PurchaseOrderId : String(36);
    CurrencyCode : String(5);
    GrossAmount : Decimal(15,3);
    NetAmount : Decimal(15,3);
    ProductId : String(36) not null;
    Quantity : Decimal(13,3);
    QuantityUnit : String(3);
    TaxAmount : Decimal(15,3);
    Header : Association to one PurchaseOrderHeader on Header.PurchaseOrderId = $self.PurchaseOrderId;
    ProductDetails : Association to one Product on ProductDetails.ProductId = $self.ProductId;
}

entity SalesOrderHeader
{
    key SalesOrderId : String(36);
    CreatedAt : Timestamp;
    CurrencyCode : String(5);
    CustomerId : String(36) not null;
    GrossAmount : Decimal(15,3);
    LifeCycleStatus : String(1) not null;
    LifeCycleStatusName : String(255) not null;
    NetAmount : Decimal(15,3);
    TaxAmount : Decimal(15,3);
    CustomerDetails : Association to one Customer on CustomerDetails.CustomerId = $self.CustomerId;
    Items : Composition of many SalesOrderItem on Items.Header = $self;
}

entity SalesOrderItem
{
    key ItemNumber : Integer;
    key SalesOrderId : String(36);
    CurrencyCode : String(5);
    DeliveryDate : Timestamp;
    GrossAmount : Decimal(15,3);
    NetAmount : Decimal(15,3);
    ProductId : String(36) not null;
    Quantity : Decimal(13,3);
    QuantityUnit : String(3);
    TaxAmount : Decimal(15,3);
    Header : Association to one SalesOrderHeader on Header.SalesOrderId = $self.SalesOrderId;
    ProductDetails : Association to one Product on ProductDetails.ProductId = $self.ProductId;
}

entity Stock
{
    key ProductId : String(255);
    LotSize : Decimal(13,3);
    MinStock : Decimal(13,3);
    Quantity : Decimal(13,3);
    QuantityLessMin : Boolean;
    UpdatedTimestamp : Timestamp;
    ProductDetails : Association to one Product on ProductDetails.ProductId = $self.ProductId;
}

entity Supplier
{
    key SupplierId : String(36);
    City : String(40);
    Country : String(3);
    EmailAddress : String(255);
    HouseNumber : String(10);
    PhoneNumber : String(30);
    PostalCode : String(10);
    Street : String(60);
    SupplierName : String(80);
    UpdatedTimestamp : Timestamp;
    Products : Composition of many Product on Products.SupplierDetails = $self;
    PurchaseOrders : Composition of many PurchaseOrderHeader on PurchaseOrders.SupplierDetails = $self;
}
