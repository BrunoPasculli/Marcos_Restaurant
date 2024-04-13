# Marco’s Restaurant

## Introduction
A friend of mine, Marco, opened a new restaurant in town last month. His specialty is all kinds of pasta. After the first month, he asks for help because he can't analyze by himself all the data he has taken from his new business.

## Problem Statement
So, as a first approach, he wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they have spent, and also which menu items are their favorite. In that way, he could have even deeper connection with his customers, which would help him deliver a better understanding of their needs and then offer them a personalised experience.

Marco plans on using these insights to help him decide whether he should expand the existing customer loyalty program. In addition, he needs help to generate some basic datasets so his team can easily inspect the data without using SQL.

I helped him organize the information he had and then created the following entity-relationship diagram:


## Datasets

### Table 1: sales
This table has the information that the customer has ordered (`customer_id`), when (`order_date`) and the product ordered identified as `product_id`. 

| customer_id | order_date | product_id |
|:------------:|:-----------:|:-----------:|
|      A       |  2024-03-01  |      1      |
|      A       |  2024-03-01  |      2      |
|      A       |  2024-03-06  |      3      |
|      A       |  2024-03-08  |      3      |
|      A       |  2024-03-01  |      1      |
|      A       |  2024-03-01  |      1      |
|      B       |  2024-03-01  |      2      |
|      B       |  2024-03-02  |      1      |
|      B       |  2024-03-07  |      3      |
|      C       |  2024-03-01  |      1      |
|      C       |  2024-03-01  |      2      |
|      C       |  2024-03-07  |      1      |

### Table 2: menu
The menu table contains the dish ordered from the menu as `product_name` with its `price` and the id of the corresponding item as `product_id`.

| product_id | product_name | price |
|:----------:|:------------:|:-----:|
|      1     |   spaghetti  |   20  |
|      2     |    ravioli   |   30  |
|      3     |   canelloni  |   40  |

### Table 3: members
And the last one, the members table, has the date of registration (`join_date`) of all the members as `customer_id` of the loyalty program of Marco’s Restaurant. 

| customer_id | join_date |
|:-----------:|:---------:|
|      A      | 2024-03-06|
|      B      | 2024-03-08|

## Case study questions
1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. Create a table that show all the data combine to help Marco and his team to better understand business information.
11. To complement the previous table in point 10, we will show a more complete one that also show the member orders only, otherwise show "NULL".

| customer_id | order_date | product_name | price | member | ranking |
|:-----------:|:----------:|:------------:|:-----:|:------:|:-------:|
|      A      | 2024-03-01 |   spaghetti  |  20   |   NO   |  NULL   |
|      A      | 2024-03-01 |   ravioli    |  30   |   NO   |  NULL   |
|      A      | 2024-03-01 |   spaghetti  |  20   |   NO   |  NULL   |
|      A      | 2024-03-01 |   spaghetti  |  20   |   NO   |  NULL   |
|      A      | 2024-03-06 |   canelloni  |  40   |  YES   |    1    |
|      A      | 2021-03-08 |   canelloni  |  40   |  YES   |    2    |
|      B      | 2021-03-01 |   ravioli    |  30   |   NO   |  NULL   |
|      B      | 2021-03-02 |   spaghetti  |  20   |   NO   |  NULL   |
|      B      | 2021-03-07 |   canelloni  |  40   |  YES   |    1    |
|      C      | 2021-03-01 |   spaghetti  |  20   |   NO   |  NULL   |
|      C      | 2021-03-01 |   ravioli    |  30   |   NO   |  NULL   |
|      C      | 2021-03-07 |   spaghetti  |  20   |   NO   |  NULL   |


## Insights for Marco
From the analysis, I have discovered the following which would be useful for Marco and his new business: 
•	Customer A and B are the most frequent visitor with 3 visits both in Mar 2024.
•	Marco’s Restaurant most popular dish is spaghetti, 6 times ordered. 
•	The first time each customer goes to Marco’s Restaurant orders ravioli or spaghetti but it’s more common the first one. 
•	Customer A and C prefer spaghetti while B likes all the menu options equally. 
•	Customer A was the 1st member of Marco’s Restaurant, and his first order was spaghetti and ravioli.
•	Before they became members, Customer A and Customer B spent $90 each. 
•	Throughout March 2024, Customer A, Customer B and Customer C had 2500 points, 1300 points and 700 points respectively.
