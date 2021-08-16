namespace com.sample;

using com.sample.Bonus from './Employees';

entity Salary
{
    key SalaryID : Integer64;
    BonusDetails : Association to one Bonus;
}
