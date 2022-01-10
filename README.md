# Database for UBS
<ins> </ins>

# Table of contents : 
- [Overview](#Overview of University Book Store)
- [Business Problems](#Business_Problems)
- [Database Analysis from business point of view](#Database Analysis from business point of view)
   -[1. Customer Information](#Customer Information)
   -[2. Promotion Data](#Promotion Data)
   -[3. Synchronization between online and offline channels](#Synchronization between online and offline channels)
   -[4. Inventory Management](#Inventory Management)
   
- [Model](#Model)
- [User Interface](#User_Interface)
- [Conclusion](#Conclusion)

# Overview of University Book Store

Unlike a conventional bookstore, the University Book store offers non-book items as well. In fact, the bulk of their inventory is comprised of logo merchandise, spirit wear, and other non-book items. They have two stores in Lafayette and an online channel as well. Besides this, they also rent out books and have a separate stock of books for the same. Unlike the name, it is more like a retail business.

# Business_Problems

* With Amazon and other online giants offering books and similar products at competitive prices, super deals, and services such as free, fast shipping, UBS is facing major threat as it is losing out on a section of potential customer segment.
* UBS has a peak season while the sale remains stagnant for the rest of the year. It is important for UBS to be a destination for students at times other than the beginning of their course. Getting more traffic and potential sales round the year is another look ahead for them.
* UBS has around 5-6 major vendors. Off late, UBS has been facing a major supply chain issue where the orders that they place are not getting delivered on time. It is becoming a huge problem for them to source products, even at 124% increment in freight cost compared to last year. The root cause is the operational shutdown in countries from where they source their products. With such latency, it is extremely important for UBS to come up with alternate plans.


# `Database Analysis from business point of view`
<ins> </ins>
## Customer Information
UBS has these competitive advantages which could help them serve their customers better:
* Captive audience for 4 years who are favorably disposed towards the brand 
* Some of their products is what the customer needs
* Some of UBS merchandise is customized and highly exclusive that competitors don’t offer
* Sale peaks are predictable, which is at the start of the semester and towards the end

However, at present, UBS does not record information about their customers who are making any transactions at the store. This information is critical to understand their customers better and then serve them in ways that cannot be easily replicated by competitors – online or offline. If they encourage students to provide an identity at each purchase, it could be linked with all their transactions which could ultimately help them serve their customers better and make customized offerings. Their campus email-IDs could be used to send exclusive offers to them. They could further use this information to communicate the buyback prices at which they could take used books at the end of their course. To leverage this, they need to link transactions to customers. This data would help UBS reap benefits exponentially in the long run.
## Promotion Data
In their database, they don’t record what discounts/promotions are they offering on which item categories. This information is important to assess the effectiveness of their promotion strategies and help them come up with even better promotion and pricing strategies that would eventually lead to more sales. Therefore, we propose to add a Promotions entity in their database architecture which will have data about all the items that were under offers/discounts and the item category it belongs to.
## Synchronization between online and offline channels
Since a brick-and-mortar store limits what it can offer in stock, UBS should leverage its online channel to cater to customers that come up with such demands and hence minimize loss of customers. At present, the online and offline channels of UBS work in isolation with separate category lines for both. There is no common attribute that links the products in both channels.
## Inventory Management
Since UBS is already facing supply chain issues, it is important for them to know their critical vendors. There are items which are supplied only by one vendor, so if they identify such cases, they know the dependency is more on them and hence those are critical to their business. They can plan their supplies and have a robust channel which does not get much impacted by the fluctuations in the cost of the distribution channel.




# `Proposed Entity-Relationship Diagram`

<img src="https://user-images.githubusercontent.com/51246077/148719902-4246d92f-a76b-4db4-91f9-3fb2c4cd0d2d.png" width="1000" height="600">



# `Relation schema of the database`

![image](https://user-images.githubusercontent.com/51246077/148720727-288e117e-0622-4ce9-987d-26719600679a.png)



# `Sample Business Insights that can be extracted from the data`

1.What is their best channel of sales on a given day (12/1/2021)?

![image](https://user-images.githubusercontent.com/51246077/148720093-892a59c6-a8df-40e8-865f-c31d18c7219c.png)


2.What is the impact of promotions on different items? (Case taken: Christmas discount) 

![image](https://user-images.githubusercontent.com/51246077/148720116-1f042f54-7397-448b-9493-7c5a7adfd256.png)

3.What price buckets work best in each category? 

![image](https://user-images.githubusercontent.com/51246077/148720150-8fd0f3ca-8114-45ce-8537-17240533bfdc.png)

4.How each employee performed over a given period? (Performance measured by number of orders processed/revenue generated by the employee)

![image](https://user-images.githubusercontent.com/51246077/148720188-89b7af2e-6e86-4f1d-b22b-25b6bf67929c.png)

5.Who are the critical vendors? (If for the supply of a particular item, the store relies on only one vendor, then because of the high dependency such a vendor, the vendor gets classified as a critical one)

![image](https://user-images.githubusercontent.com/51246077/148720202-0a775734-4b33-4bb1-94da-2c426db1402f.png)


6.What is the quantity of items available in the store on a given day?

![image](https://user-images.githubusercontent.com/51246077/148720261-68cbe263-6198-4ae2-b0b5-93258aa2959b.png)

7.Which are the most running items in the store?

![image](https://user-images.githubusercontent.com/51246077/148720282-804154ee-4c0b-4497-9cf9-ec6ad2564280.png)

8. Who are our loyal customers? 

![image](https://user-images.githubusercontent.com/51246077/148720296-f7b7d181-809a-4f90-b50d-6e77671b09ff.png)


9. How does the market basket of some of the top customers look like?

![image](https://user-images.githubusercontent.com/51246077/148720336-c5f890b9-ed19-4f4f-bb1b-7a55c632696c.png)


10.  Which is the most profitable channel? 

![image](https://user-images.githubusercontent.com/51246077/148720438-874d3c11-2c4f-4cb3-87fc-5d6b1eab5a3d.png)






# `Recommendations`

* Since UBS has customer information and hence better insights about customers on an individual basis, they could provide offers to customers based on it.

* In addition, now that we can identify their loyal customers, UBS could send exclusive offers to them. Since UBS’ customers is a homogeneous set and have strong affiliations to Purdue brand, most of the items that UBS sells would be of interest to them even after graduating. UBS could send exclusive offers via emails to such customers which is a potential source of revenue.

* With the promotions table in place and the ability to assess the effectiveness of the promotion policies, UBS can do a fair analysis of what products if offered on sale can have the maximum impact on revenue. They could accordingly design their future promotion policies and decide which items to include in which kind of promotions and when to offer the

* Since UBS would be leveraging online channel by collaborating with potential competitors, we created an online table. Now they could assess the effectiveness and profitability of different channels and monitor trends over the year. This would help them take better decisions on where to offer which products which would ultimately boost their revenue and profits.

* UBS can handle inventory management in a better manner as they know which vendors are critical, i.e., which vendors they depend more for which items. So, they could manage their supply and inventory in a manner that even if the critical vendors are unable to meet the supplies, they have alternatives and solutions.






