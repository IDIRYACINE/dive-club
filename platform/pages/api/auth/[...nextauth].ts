// @ts-nocheck

import NextAuth from "next-auth"

import GoogleProvider from "next-auth/providers/google";
import * as firestoreFunction from "firebase/firestore";
import { FirestoreAdapter } from "@next-auth/firebase-adapter";
import { cert } from "firebase-admin/app";



export const authOptions =
{
    adapter: FirestoreAdapter({
        credential: cert({
          projectId: process.env.FIREBASE_PROJECT_ID,
          clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
          privateKey: process.env.FIREBASE_PRIVATE_KEY,
        })
      }),
      
    secret: process.env.NEXTAUTH_SECRET,
    session: {
        strategy: "jwt"
    },
    providers: [
        GoogleProvider({
            clientId: process.env.GOOGLE_CLIENT_ID!,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET!,
            httpOptions: {
                timeout: 40000,
            },
        }),

    ],
    callbacks: {

        async signIn({ user, account, profile }) {

            return true
        },


        async session({ session, user, token }) {
            if(token){
                session.user = token
            }
            if(user){
                session.user = user
            }
            

            return session
        },

        async redirect({ url, baseUrl }) {
            return baseUrl
          },

        async jwt({ user, token, account, profile,session }) {

            if (account) {
                token.accessToken = account.access_token
                token.id = account.id
            }



            return token
        },

    }
}


export default NextAuth(
    authOptions
)