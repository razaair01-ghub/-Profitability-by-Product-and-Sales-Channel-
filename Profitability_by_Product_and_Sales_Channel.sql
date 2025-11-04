
WITH Sales_Table AS(
SELECT   ProductKey,SalesTerritoryKey,SalesAmount,TotalProductCost,SalesAmount-TotalProductCost Profit,OrderDate Date,
		'Internet' AS SalesChannel

		FROM dbo.FactInternetSales

Union all
SELECT   ProductKey,SalesTerritoryKey,SalesAmount,TotalProductCost,SalesAmount-TotalProductCost Profit,OrderDate Date,
		'Reseller' AS SalesChannel

		FROM dbo.FactResellerSales
		)
SELECT 
		st.SalesTerritoryRegion Region,c.EnglishProductCategoryName Category,p.EnglishProductName Product,s.SalesChannel SalesChannel,
		ROUND(SUM(s.SalesAmount),2) Revenue,ROUND(SUM(s.Profit),2) Profit,ROUND((s.Profit/s.SalesAmount)*100,2) ProfitMargin,s.Date
		--Profit margin in percent  profit/SalesAmount)*100)
		FROM Sales_Table s
		 JOIN dbo.DimProduct p
			  ON p.ProductKey=s.ProductKey
			  JOIN dbo.DimProductSubcategory sb
			  on sb.ProductSubcategoryKey=p.ProductSubcategoryKey
			  JOIN dbo.DimProductCategory c
			  ON c.ProductCategoryKey=sb.ProductCategoryKey
			  JOIN dbo.DimSalesTerritory st
			  On st.SalesTerritoryKey=s.SalesTerritoryKey
	GROUP BY st.SalesTerritoryRegion,c.EnglishProductCategoryName,p.EnglishProductName,s.SalesChannel,ROUND((s.Profit/s.SalesAmount)*100,2),Date
	ORDER BY Revenue DESC,ProfitMargin Asc

