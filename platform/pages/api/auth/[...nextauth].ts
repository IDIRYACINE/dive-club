import NextAuth from "next-auth"

import GoogleProvider from "next-auth/providers/google";
import * as firestoreFunction from "firebase/firestore";
import { FirestoreAdapter } from "@next-auth/firebase-adapter";



export const authOptions =
{
    adapter: FirestoreAdapter(),
    secret: process.env.NEXTJS_SECRET,
    session: {
        strategy: "jwt"
    },
    // pages: {
    //     signIn: "/login",
    // },

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