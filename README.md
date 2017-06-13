BUMK706 “Advanced Models for Marketing Decisions”

Project #1: Pricing Decisions for Tropicana Orange Juice

General Instructions on the Project Memo:

Please include a cover page with the title of the project, name of your group (A, B, C, … etc.), and each group member’s name. Please also include the honor pledge.

The main text of the memo should be no more than 2 pages, single-spaced. In addition, you can include a number of tables and figures in the appendices. There is no strict limit on the number of appendices, but please include only the essential information necessary to support your analysis.

Please refer to the document “Project Memo Template” for the format and suggested contents of the memo. This file is posted on Canvas in the folder “Files Assignments”.

You should work with only members in your own group for the assignment.

This assignment is due at the beginning of the next computer class. Please hand in a hardcopy of the memo.

 Background:

Nick’s is a regional grocery retailer with 15 stores in a mid-west market. You have recently been hired by Nick’s to assist in the pricing of the retailer’s products in selected categories. The specific task for your team is to determine the optimal retail price for a particular item in the refrigerated orange juice category: Tropicana 64 ounces. This item, defined by brand×size combination, is the largest selling item in the category for the retailer.   

You are provided with data on weekly sales volume, retail price, and special promotions (in-store displays and feature advertising) for the item in each of the 15 stores during a two-year period, starting at the beginning of January 2009 and ending in the last week of December 2010.  The dataset is available from the Canvas course web site in the folder “Files  Assignments  Project 1”. For your convenience, it is available in three formats: 1) a SAS data file (“tropic.sas7bdat”), 2) an EXCEL file (“tropic.xls”), and 3) a text file (“tropic.txt”) which can be read in to other software of your choice. 
There are five variables in the dataset. The following is a description of the variables.

STORE: each store has a unique code (2, 14, 32, 52, 62, 68, 71, 72, 93, 95, 111, 123, 124, 130, 137).

WEEK: ranges from 1 to 104, with 1 = the first week of January 2009, and 104 = the last week of December 2010.

QUANT: weekly sales volume in a store, measured in ounces. (Note that, to make sales data comparable across different package sizes, the retailer has converted number of bottles sold into ounces for all orange juice items.)

PRICE: retail price for Tropicana 64 oz., measured in $/bottle. It reflects any temporary price reduction that was offered in a particular week. For example, if the regular price was $3.99 and price discount was $0.30, then PRICE = 3.69.

DEAL: a dummy variable for in-store display and/or feature advertising. DEAL = 1 if the item was on display and/or feature ad; 0 if it was on neither display nor feature ad.

The variables are compiled in each data file according to the above order.

Historically, the retailer made pricing recommendations at the chain level, but relied on each store manager to make the final pricing decisions for his/her store. Now the retailer wants to standardize the price of the same item sold in all 15 stores in order to achieve a more unified price image. With your help, it hopes to choose the most appropriate price points.

Currently, the wholesale list price (i.e., the price charged by the manufacturer to the retailer) for Tropicana 64 oz. is $2.57 per bottle, which is expected to stay the same in the coming months.

Assignment:

Your task is to analyze the effects of price and other relevant variables on sales, and to determine the optimal retail price for Tropicana orange juice 64 oz. as of week 105, i.e., immediately after the data collection period. The retailer’s stated objective for the item is to maximize its gross profit (without regard to any other objectives such as store traffic generation, price image building, category profit optimization, etc.). Therefore, for the purpose of this part of the analysis, you can act as if Tropicana 64 oz. is the only item sold in the entire refrigerated orange juice category by the retailer. In addition, you can assume that price elasticity is the same in the entire market. The retailer does not plan to offer any special promotions for the item in week 105.

Your memo should address the following issues:

Provide some basic descriptive statistics of the key variables in the data (such as means, maxima, minima, medians, standard deviations) and explore interesting patterns in the data.

Fit at least one linear regression model, one semi-log model, and one log-log model to explore the effect of price on sales of Tropicana 64 oz., while controlling for the effects of other relevant factors. Interpret the key model estimation results.

Select the best fitting model and justify your choice (e.g., why you included certain variables, how you made trade-offs, how you determine the functional form of the model – linear, semi-log, or log-log, and why you chose this particular model).

Determine the optimal retail price for Tropicana 64 oz. based on your best fitting model.

You are encouraged to explore the profit implications of your optimal price recommendation, as well as any other issues relevant to this project.
