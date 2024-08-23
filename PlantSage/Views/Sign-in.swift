//
//  Sign-in.swift
//  PlantSage
//
//  Created by Sariye Yaman on 22.08.2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct Sign_in: View {
    
    @State private var email = ""
    @State private var  password = ""
    
    @State private var isLoading = false
    
    //Now we add new var isSigned so when user successfuly log in then they  wil move to main screen
    
    @State private var isSigned = false
    
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing:40 , content: {
                
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
                
                VStack(alignment: .leading,spacing: 15, content: {
                    Text("Sign-in")
                        .font(.title)
                    
                    Text("Enter your email address and password and continue shopping.")
                        .font(.callout)
                })
                
                VStack(spacing: 15 , content: {
                    TextField("Email Address" , text: $email)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(.gray.opacity(0.8), lineWidth: 0.5))
                    
                    SecureField("Password" , text: $password)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(.gray.opacity(0.8), lineWidth: 0.5))
                })
                
                Spacer()
                
                //Login button
                VStack(spacing: 15, content: {
                    Button{
                        
                        //Here we add isLoading = true because we see progressView not show after click
                        isLoading = true
                        Auth.auth().signIn(withEmail: email , password: password){(result, error)
                            
                            in
                            
                            if error != nil{
                                print(error?.localizedDescription ?? "")
                                withAnimation{
                                    isLoading.toggle()
                                }
                            }else{
                                //Now we collect user information move to next view in app
                                //this we will  do after signup view code
                                
                                //here user Successfully sign in so we change isSİgned
                                
                                isSigned = true
                                
                                let db = Firestore.firestore()
                                db.collection("USERS").document(result?.user.uid ?? "" ).getDocument{
                                    document, error
                                    in
                                    
                                    if let document = document , document.exists{
                                        let name = document.get("User Name") as? String ?? ""
                                        let email = document.get("Email") as? String ?? ""
                                        
                                        //Now we store collected name and email from firestore to local storage
                                        
                                        UserDefaults.standard.set(name,forKey: "NAME")
                                        UserDefaults.standard.set(name,forKey: "EMAIL")
                                        
                                        isLoading.toggle()
                                    }
                                    else{
                                        isLoading.toggle()
                                        print("document no existq")
                                    }
                                }
                                
                            }
                            
                        }
                    }label: {
                        if isLoading{
                            ProgressView()
                        }else{
                            Text("Continue")
                                .fontWeight(.semibold)
                        }
                            
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.green)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .navigationDestination(isPresented: $isSigned){
                        ContentView()
                    }
                    
                    NavigationLink{
                        Sign_up()
                    }label: {
                        Text("Not having account? **Sign-up**")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(.black)
                })
            })
            .padding()
        }
    }
}

#Preview {
    Sign_in()
}

