//
//  SearchDiscoveryViewController.swift
//  VitalEssence
//
//  Created by Kiahna Isadore on 4/22/24.
//

import UIKit
import Nuke

class SearchDiscoveryViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("🍏 cellForRowAt called for row: \(indexPath.row)")
        
        //let cell = UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        let recipe = recipies[indexPath.row]
        
        if let posterPath = recipe.strMealThumb,
           
            // Create a url by appending the poster path to the base url. https://developers.themoviedb.org/3/getting-started/images
           let imageUrl = URL(string: posterPath){
            
            // Use the Nuke library's load image function to (async) fetch and load the image from the image URL.
            Nuke.loadImage(with: imageUrl, into: cell.recipeImage)
        }
        
        cell.recipeLabel?.text = recipe.strMeal
        
        return cell
    }
    
    
    private var recipies: [Recipe] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        searchBar.delegate = self
        fetchRecipe(withQuery: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else {
            // If search query is empty, display all recipes
            fetchRecipe(withQuery: nil)
            return
        }
        // Fetch recipes based on search query
        fetchRecipe(withQuery: query)
    }
    
    private func fetchRecipe(withQuery query: String?) {
        
        // URL for the TMDB Get Popular movies endpoint: https://developers.themoviedb.org/3/movies/get-popular-movies
        //let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?i=")!
        var urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?i="
        if let query = query {
            urlString += "\(query)"
        }
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        // Create the URL Session to execute a network request given the above url in order to fetch our movie data.
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                print("🚨 Request failed: \(error.localizedDescription)")
                return
            }
            
            // Check for server errors
            // Make sure the response is within the `200-299` range (the standard range for a successful response).
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("🚨 Server Error: response: \(String(describing: response))")
                return
            }
            
            // Check for data
            guard let data = data else {
                print("🚨 No data returned from request")
                return
            }
            
            // The JSONDecoder's decode function can throw an error. To handle any errors we can wrap it in a `do catch` block.
            do {
                // Decode the JSON data into our custom `MovieResponse` model.
                let recipeResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
                // Access the array of recipies
                let recipies = recipeResponse.meals
                // Run any code that will update UI on the main thread.
                DispatchQueue.main.async { [weak self] in
                    // We have movies! Do something with them!
                    print("✅ SUCCESS!!! Fetched \(recipies.count) recipies")
                    // Iterate over all movies and print out their details.
                    for recipe in recipies {
                        print("🍿 Recipe ------------------")
                        print("Title: \(recipe.strMeal)")
                        print("id: \(recipe.idMeal)")
                    }
                    // TODO: Store movies in the `movies` property on the view controller
                    self?.recipies = recipies
                    self?.tableView.reloadData()
                    print("🍏 Fetched and stored \(recipies.count) recipies")
                }
            } catch {
                print("🚨 Error decoding JSON data into Movie Response: \(error.localizedDescription)")
                return
            }
        }
        // run the session!
        session.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedRecipe = recipies[indexPath.row]
            fetchRecipeDetails(withID: selectedRecipe.idMeal)
        }
        
    private func fetchRecipeDetails(withID id: String) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        let session = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            // Handle response
            if let error = error {
                print("🚨 Request failed: \(error.localizedDescription)")
                return
            }
            
            // Check for server errors
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("🚨 Server Error: response: \(String(describing: response))")
                return
            }
            
            // Check for data
            guard let data = data else {
                print("🚨 No data returned from request")
                return
            }
            
            do {
                print("API Response: \(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")")
                let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                print("API Response: \(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")")
                if let meal = mealResponse.mealDetail.first {
                    print("Fetched meal: \(meal)")
                    DispatchQueue.main.async {
                        self?.performSegue(withIdentifier: "showDetail", sender: meal)
                    }
                } else {
                    print("No meal found in response")
                }
            } catch {
                print("Error decoding JSON data into Meal Response: \(error.localizedDescription)")
                return
            }
        }
        session.resume()
    }

        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Preparing for segue")
            if segue.identifier == "showDetail" {
                if let destinationVC = segue.destination as? DetailViewController,
                   let selectedMeal = sender as? Meal {
                    destinationVC.instructions = selectedMeal
                }
        }
    }
}
