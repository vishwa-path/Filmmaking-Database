# Filmmaking Database
## Problem Statement
* The process of filmmaking takes a lot of precise planning and management. A movie is categorized on the basis of several components like it’s title, starting date of shoot, estimated number of days of shoot,  release date, and genre. The top genres are action, drama, comedy, horror, thriller, romance, crime, adventure, and animated. 
* Primarily there are three roles that impact the outcome of a film, the director, producer, and the financier. Then there’s the cast and crew which includes music directors, editors, DOPs, and actors. The cast is divided based on their gender, and age. Every person involved in filmmaking has a CPF (Cost per Film).
* There are many release platforms and each platform has its own audience, number of profiles per account, and the price per month. The platform must have at least 100,000 users to buy the rights for a film. Each platform has its own CPV (Cost per view), but does not disclose the number of views to it’s filmmakers.
* The director approaches a producer to fund the film. Every director has a certain number of assistant directors under him/her and every producer has a certain number of executive producers under him/her.
* The producer goes through the story and discusses the requirements of the script with the director, and drafts a budget for the film. The budget of the film has to take care of the production cost, cast and crew cost, and the director’s cost. The producer takes a term loan from a financer with an interest.
## ER diagram
![Untitled Diagram (24)](https://user-images.githubusercontent.com/60057580/99275478-90b25380-2851-11eb-987b-d1cb4e83df58.png)
## Logical Schema
![Logical_Schema](https://user-images.githubusercontent.com/60057580/99277308-a9236d80-2853-11eb-9f1e-5eadac8d884d.PNG)
## Stakeholders and their Access Level
* **Director**: Admin access to Director, Movie and Producers with their unique director ID. View access to cast and crew members.
* **Producer**: Admin access to Producer, budget, Financier, Director with their unique producer ID. View access to movie, and platform.
* **Financier**: Admin access to Financier, Producer with their unique financier ID. View access to movie, and platform.
* **Crew Member**: Admin access to Crew Member, Movie with their unique member ID. View access to director and producer.
* **Cast Member**: Admin access to Cast Member, Movie with their unique member ID. View access to director and producer.
* **Platform**: Admin access to Platform, and Movie with their unique platform ID to update number of users and profiles. View access to director and producer.
