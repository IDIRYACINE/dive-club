import NextAuth from "next-auth"

import { FirestoreAdapter } from "@auth/firebase-adapter";
import GoogleProvider from "next-auth/providers/google";
import * as firestoreFunction from "firebase/firestore";



export const authOptions =
{
    adapter: FirestoreAdapter(),
    secret: process.env.NEXTJS_SECRET,
    session: {
        strategy: "jwt",
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
        authorized({ req, token }) {
            if (token) return true
        },

        async signIn({ user, account, profile }) {
            return true
        },


        async session({ session, user, token }) {
            session.role = "customer"
            session.user = user
            session.token = token

            return session
        },

        async jwt({ user, token, account, profile }) {
            if (account) {
                token.accessToken = account.access_token
                token.id = profile.id
            }
            return token
        },

    }
}


export default NextAuth(
    authOptions
)