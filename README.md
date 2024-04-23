# VitalEssence

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [Sprint Planning](#Sprint-Planning)

## Overview

### Description

Helps users plan meals, discover recipes, and track nutrition. Users can log meals by scanning barcodes and search for recipes.

### App Evaluation

- **Category:**
     - Health & Fitness
- **Mobile:**
    - It can utilize features like camera for scanning barcodes, location for finding nearby grocery stores, and real-time updates for meal planning.
- **Story:**
    - The story revolves around making meal planning easier and healthier for users. The value lies in saving time and making healthier food choices.
- **Market:**
    - The market for meal planning apps is sizable, especially among health-conscious individuals and those with dietary restrictions.
- **Habit:**
    - The app has the potential to be habit-forming, especially for users trying to maintain a healthy lifestyle.
- **Scope:**
    - The scope seems well-defined with clear functionalities. Implementing features like barcode scanning might pose technical challenges, but overall, it's feasible.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User registration and profile creation
* Recipe logging
* Recipe search and discovery

**Optional Nice-to-have Stories**

* Barcode scanning

### 2. Screen Archetypes

-  Login/Registration Screen
    - User can log in (Required)
    - User can create a new account (Required)
-  Profile Creation/Settings Screen
    - User can input personal details such as age, weight, height, and dietary preferences (Required)
-  Recipe Logging Screen
    - User can log their recipes by manually entering food items or selecting from a database of common foods (Required)
-  Recipe Search and Discovery Screen/Home
    - User can search for recipes based on ingredients, cuisine type, dietary restrictions, etc. (Required)
-  Barcode Scanning Screen (Optional)
    - User can scan barcodes of packaged food items to input nutritional information into their meal logs (Optional)

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Profile
* Recipes
* Recipe Discover and Search (Home)

**Flow Navigation** (Screen to Screen)

- Login/Registration
    * => Recipe Search and Discovery
    * => Create Account
- Profile
    * => Settings
- Recipe Logging
    * => Barcode Scanner(maybe)

## Wireframes
![IMG_6576](https://github.com/Kisadore/VitalEssence/assets/118093694/da32c01b-2274-4c84-b670-82564b89af6a)


## Sprint Planning and Development

### Main Features
- [X] Logo and Launch Screen
- [X] Login Screen
- [ ] User Profile Setup (Optional)
- [ ] Meal Logging/adding new recipies Functionality
- [X] Recipe Search and Discovery
- [ ] Recipe Details Screen
- [ ] Barcode Scanning Integration (Optional)

### Sprint 2:
- [ ] login
     - [ ] integrate basic authentication functionality.
     - [X] design screen
- [ ] profile
     - [ ] Create user profile setup screens for inputting personal details.
- [ ] meal/recipe logging
     - [ ] Integrate functionality for users to manually input food items and log meals.
     - [ ] Implement basic local data persistence for meal logs.
- [X] recipe search and discovery
     - [X] Integrate an API or database for accessing recipes.
     - [X] Implement search functionality based on ingredients, cuisine type, etc.
- [X] link navagation

#### Progress
<div>
    <a href="https://www.loom.com/share/50c3854089f34be99b2e79e3587a2f78">
    </a>
    <a href="https://www.loom.com/share/50c3854089f34be99b2e79e3587a2f78">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/50c3854089f34be99b2e79e3587a2f78-with-play.gif">
    </a>
  </div>

#### Reflection
I had the most trouble figuring out how to use the text from the search bar. Next I will be work on the recipe details screen and update my login screen where it actually checks for a username and password.

### Sprint 1:
- [X] create app logo on canva
- [X] create launch screen on canva

#### Progress
<div>
    <a href="https://www.loom.com/share/fc4e38f5987f4056ad64dc1a7fecaf6a">
    </a>
    <a href="https://www.loom.com/share/fc4e38f5987f4056ad64dc1a7fecaf6a">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/fc4e38f5987f4056ad64dc1a7fecaf6a-with-play.gif">
    </a>
  </div>

#### Reflection
It was pretty simple, I had no problems creating the app logo and launchscreen on canva. Next I will be working on sprint 2 and sprint 3.


### Sprint 3: (Optional) 

- [ ] Integrate barcode scanning functionality into the app.
- [ ] Implement UI elements for barcode scanning.
- [ ] Integrate barcode scanning with meal logging to input nutritional information.


## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
