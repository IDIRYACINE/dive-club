import LoginForm from "@/features/auth/loginForm";
import { atheletesRoute } from "@/features/navigation/logic/routes";
import { getServerSession } from "next-auth/next";
import { redirect } from 'next/navigation'
import clsx from 'clsx'

export default async function Home() {

  redirect(atheletesRoute)

  return (<>
  </>)

  // const session = await getServerSession()

  // if (session) {
  //   redirect(atheletesRoute)
  // }

  // const className = clsx([
  //   "h-screen flex justify-center items-center p-4"
  // ])

  // return (

  //   <div className={className}>
  //     <LoginForm />
  //   </div>
  // )
}
