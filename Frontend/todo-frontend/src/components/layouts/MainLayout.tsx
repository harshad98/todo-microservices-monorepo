import Navbar from "../Navbar";


export default function MainLayout({
  children,
}: {
  children: React.ReactNode;
}) {

  return (
    <>
      <Navbar />

      <div className="container mx-auto p-6">
        {children}
      </div>
    </>
  );
}