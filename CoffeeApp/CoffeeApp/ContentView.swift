import SwiftUI

// MARK: - ContentView
struct ContentView: View {
    @State private var coffeeList: [Coffee] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView("Loading Coffee...")
            } else if let errorMessage = errorMessage {
                VStack {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }
            } else {
                List(coffeeList) { coffee in
                    NavigationLink(destination: CoffeeDetailsView(coffee: coffee)) {
                        VStack(alignment: .leading) {
                            Text(coffee.name)
                                .font(.headline)
                            Text("Region: \(coffee.region)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .navigationTitle("Coffee List")
            }
        }
        .onAppear(perform: fetchCoffeeData)
    }
    
    // MARK: - Fetch Coffee Data
    func fetchCoffeeData() {
        guard let url = URL(string: "https://fake-coffee-api.vercel.app/api") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                    return
                }
                
                guard let data = data else {
                    self.errorMessage = "No data received"
                    self.isLoading = false
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let fetchedCoffeeList = try decoder.decode([Coffee].self, from: data)
                    self.coffeeList = fetchedCoffeeList
                } catch {
                    self.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }
                
                self.isLoading = false
            }
        }.resume()
    }
}

// MARK: - CoffeeDetailsView
struct CoffeeDetailsView: View {
    var coffee: Coffee
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Coffee Name
                Text(coffee.name)
                    .font(.largeTitle)
                    .bold()
                
                // Coffee Price
                Text("Price: $\(coffee.price, specifier: "%.2f")")
                    .font(.title2)
                
                // Coffee Region
                Text("Region: \(coffee.region)")
                    .font(.title3)
                
                // Roast Level
                Text("Roast Level: \(coffee.roastLevel)")
                    .font(.headline)
                
                // Weight
                Text("Weight: \(coffee.weight)g")
                    .font(.body)
                
                // Flavor Profile
                Text("Flavor Profile:")
                    .font(.headline)
                Text(coffee.flavorProfile.joined(separator: ", "))
                    .font(.body)
                    .italic()
                
                // Description
                Text("Description:")
                    .font(.headline)
                Text(coffee.description)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(coffee.name)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
