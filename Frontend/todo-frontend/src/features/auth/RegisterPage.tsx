import { useState } from "react";
import { registerApi } from "../../api/authApi";
import { useNavigate, Link } from "react-router-dom";

export default function RegisterPage() {

  const navigate = useNavigate();

  const [username, setUsername] =
    useState("");

  const [email, setEmail] =
    useState("");

  const [password, setPassword] =
    useState("");

  const handleSubmit = async (
    e: React.FormEvent
  ) => {

    e.preventDefault();

    await registerApi({
      username,
      email,
      password,
    });

    navigate("/login");
  };

  return (
    <div className="flex justify-center mt-20">

      <form
        onSubmit={handleSubmit}
        className="w-96 space-y-4 border p-6 rounded"
      >

        <h2 className="text-2xl font-bold">
          Register cicd is done 
        </h2>

        <input
          className="border p-2 w-full"
          placeholder="Username"
          value={username}
          onChange={(e) =>
            setUsername(e.target.value)
          }
        />

        <input
          className="border p-2 w-full"
          placeholder="Email"
          value={email}
          onChange={(e) =>
            setEmail(e.target.value)
          }
        />

        <input
          type="password"
          className="border p-2 w-full"
          placeholder="Password"
          value={password}
          onChange={(e) =>
            setPassword(e.target.value)
          }
        />

        <button
          className="bg-blue-500 text-white w-full p-2 rounded"
        >
          Register
        </button>

        <Link
          to="/login"
          className="block text-center text-blue-500"
        >
          Already have account?
        </Link>

      </form>

    </div>
  );
}