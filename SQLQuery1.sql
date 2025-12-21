use Marketing

select * from products
select * from customers
select * from engagement_data
select * from geography
select * from customer_reviews
select * from customer_journey

--split products into categories based on price (High-Medium-Low) (products Table)

select 
    ProductID,  
    ProductName,  
    Price, 
    case 
       when Price<50 then 'Low' 
       when Price between 50 and 200 then 'Medium'
       else 'High'
    end as ProductsCategory
from products


/*
merge customers & geography Tables based on thier relation on geographyid & 
categories country based on geographic area and city based on size (Customers Table)
*/

select *,
    case 
        when Country IN ('Austria', 'Germany', 'Switzerland') then 'Central Europe'
        when Country IN ('France', 'Belgium', 'Netherlands', 'UK') then 'Western Europe'
        when Country IN ('Italy', 'Spain') then 'Southern Europe'
        when Country IN ('Sweden') then 'Northern Europe'
        else 'Other'
    end as Geographical_Area,

    case
        when City IN ('Paris', 'Berlin', 'London') then 'Mega'
        when City IN ('Vienna', 'Rome', 'Madrid') then 'Large'
        when City IN ('Brussels', 'Amsterdam', 'Stockholm', 'Zurich') then 'Medium'
        else 'Small'
    end as City_Size
from customers c left join geography g
on c.GeographyID=g.GeographyID


--edit space between text in review text column (Customers_reviews Table)
select 
    ReviewID,  
    CustomerID,  
    ProductID,  
    ReviewDate,  
    Rating,  
    replace(ReviewText, '  ', ' ') as ReviewText
from 
    customer_reviews


/*split clicks and views from ViewsClicksCombined column into sperate columns,
change EngagementDate to date type and format it (engagement_data Table)*/
select 
    EngagementID,  
    ContentID,  
	CampaignID,  
    ProductID,  
    upper(replace(ContentType, 'Socialmedia', 'Social Media')) as ContentType,
    left(ViewsClicksCombined,charindex('-',ViewsClicksCombined)-1) Views,
    right(ViewsClicksCombined,charindex('-',ViewsClicksCombined)-2) Clicks,
    format(convert(DATE, EngagementDate), 'dd.MM.yyyy') AS EngagementDate,
    Likes
from engagement_data
where ContentType != 'Newsletter'


--create cte to display duplicates 
with dupplicate_record as (
select 
JourneyID,
CustomerID,
ProductID,
VisitDate,
Stage,
Action,
Duration,
row_number() over(
partition by CustomerID,ProductID,VisitDate,Stage,Action 
order by JourneyID ) as row_num
from customer_journey
)


--display dupplicates
select * 
from dupplicate_record
where row_num>1
order by JourneyID

--display correct data after convert stage to upper and replace null values in duration w avg duration (customer_journey table)
select 
    JourneyID,  
    CustomerID, 
    ProductID,  
    VisitDate,  
    Stage, 
    Action, 
    coalesce(Duration, avg_duration) as Duration  
from 
    (
        select 
            JourneyID,  
            CustomerID,  
            ProductID,  
            VisitDate,  
            upper(Stage) as Stage,  
            Action,  
            Duration,  
            avg(Duration) over (partition by VisitDate) AS avg_duration, 
            row_number() over (
                partition by CustomerID, ProductID, VisitDate, upper(Stage), Action 
                order by JourneyID  
            ) as row_num  
        from 
            customer_journey  
    ) as subquery  
where 
    row_num = 1

