namespace com.sample;

using ESPM from './ESPM2';

type emptypeTest
{
    desc : String;
    empkind : emptypeEmpkind;
}

event myEventName
{
    myEventProperty : String;
}

entity Addresses
{
    key ID : Integer;
    EmpAddr : Association to one Employees;
    CustAddrPK : Association to one ESPM.Customer;
}

entity Bonus
{
    key BonusID : Integer64;
}

entity Employees
{
    key ID : Integer;
    gender : Gender;
    jobTitle : String;
    location : String(100) not null;
    name : String;
    PtnEmp : Association to one Addresses on PtnEmp.EmpAddr = $self;
}

function countOrders
(
)
returns Integer;

type Gender : String enum
{
    female;
    male;
    none;
}

type emptypeEmpkind : String enum
{
    contract;
    permanent;
}
