//
//  Sign-up.swift
//  PlantSage
//
//  Created by Sariye Yaman on 22.08.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct Sign_up: View {
    
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var isLoading = false
    
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
                    Text("Sign-up")
                        .font(.title)
                    
                    Text("Enter your email address and password and continue shopping.")
                        .font(.callout)
                })
                
                VStack(spacing: 15 , content: {
                    TextField("Username" , text: $userName)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(.gray.opacity(0.8), lineWidth: 0.5))
                    
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
                        //Sign-up
                        isLoading.toggle()
                        Auth.auth().createUser(withEmail: email, password: password){
                            (result, error)
                            in
                            if error != nil{
                                print(error?.localizedDescription ?? "")
                                withAnimation{
                                    isLoading.toggle()
                                }
                            }else{
                                //Now we store user basic details to firestore database
                                let db = Firestore.firestore()
                                let data: [String: Any] = [
                                    "User Name": userName,
                                    "Email": email,]
                                
                                //Now we add same user name and email  to local memory so we don't need to sync every time
                                UserDefaults.standard.setValue(result?.user.uid, forKey: "UID")
                                //UID is unique key provided to user when they sign up to firestore database
                                
                                UserDefaults.standard.setValue(userName, forKey: "NAME")
                                UserDefaults.standard.setValue(email, forKey: "EMAIL")
                                                                
                                db.collection("USERS").addDocument(data: data)
                                isLoading.toggle()
                                
                                isSigned = true
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
                    .background(Color(red: 0.31, green: 0.55, blue: 0.31))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .navigationDestination(isPresented: $isSigned){
                        ContentView()
                    }
                    
                    NavigationLink{
                        Sign_in()
                    }label: {
                        Text("Already have an account? **Sign-in**")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(.black)
                    
                })
            })
            .padding()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    Sign_up()
}
