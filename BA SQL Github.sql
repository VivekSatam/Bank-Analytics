create database P_330;
use p_330;

select * from finance1;
select * from finance2;


# Year Wise Loan Amount Status
select right(issue_d,4) as year, sum(loan_amnt) as `Loan Amount`
from finance1
group by year
order by year;


# Grade-Sub grade wise revol_balance
select grade, sub_grade, sum(revol_bal) as Revol_Balance
from finance1, finance2
where finance1.id = finance2.id
group by sub_grade, grade
order by sub_grade;


# Total payments for verified, non verified status
select verification_status, round(sum(total_pymnt),2) as `Total Payments`
from finance1, finance2
where finance1.id = finance2.id and (verification_status = "verified" or verification_status= "Not Verified")
group by verification_status;


# State Wise Loan Status
select addr_state, count(addr_state) Loan_Count, sum(loan_amnt) as `Loan Amount`
from finance1
group by addr_state
order by count(addr_state) desc;


# Home Ownership last Payment
select right(last_pymnt_d,4) as yr, home_ownership,count(home_ownership)
from finance1, finance2
where finance1.id= finance2.id
group by yr, home_ownership
order by yr;

select home_ownership,count(home_ownership)
from finance1
group by home_ownership
order by count(home_ownership) desc;