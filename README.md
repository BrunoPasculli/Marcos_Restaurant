# Marco’s Restaurant

## Introduction
A friend of mine, Marco, opened a new restaurant in town last month. His specialty is all kinds of pasta. After the first month, he asks for help because he can't analyze by himself all the data he has taken from his new business.

## Problem Statement
So, as a first approach, he wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they have spent, and also which menu items are their favorite. In that way, he could have even deeper connection with his customers, which would help him deliver a better understanding of their needs and then offer them a personalised experience.

Marco plans on using these insights to help him decide whether he should expand the existing customer loyalty program. In addition, he needs help to generate some basic datasets so his team can easily inspect the data without using SQL.

I helped him organize the information he had and then created the following entity-relationship diagram:


## Datasets

## Table 1: sales
This table has the information of which have ordered the customer (`customer_id`), when (`order_date`) and the product ordered identifed with a `product_id`. 

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

