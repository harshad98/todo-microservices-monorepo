import { useState } from "react";
import { useAppDispatch } from "../../hooks/useAppDispatch";
import { loginUser } from "./authSlice";
import {
  useNavigate,
  Link,
} from "react-router-dom";
// just checking the loginpage push
export default function LoginPage() {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const [username, setUsername] =
    useState("");

  const [password, setPassword] =
    useState("");

  const handleSubmit = async (
    e: React.FormEvent
  ) => {
    e.preventDefault();

    await dispatch(
      loginUser({
        username,
        password,
      })
    );

    navigate("/todos");
  };

  return (
    <div className="flex flex-col items-center mt-16">

      {/* Portfolio Header */}
      <div className="text-center mb-8">
        <h1 className="text-4xl font-bold text-white">
          Todo Management Platform CICD three
        </h1>

        <p className="text-gray-400 mt-2">
          React • Spring Boot • JWT • PostgreSQL • Microservices
        </p>

        <p className="text-green-400 mt-2">
          Containerized with Docker & Deployed on Azure Kubernetes Service (AKS)
        </p>

        <p className="text-blue-400 font-medium mt-2">
          Developed by Harshad Raut
        </p>
      </div>

      {/* Login Form */}
      <form
        onSubmit={handleSubmit}
        className="w-96 space-y-4 border p-6 rounded"
      >
        <h2 className="text-2xl font-bold text-center">
          Login
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
          type="password"
          className="border p-2 w-full"
          placeholder="Password"
          value={password}
          onChange={(e) =>
            setPassword(e.target.value)
          }
        />

        <button
          type="submit"
          className="bg-blue-500 text-white w-full p-2 rounded hover:bg-blue-600"
        >
          Login
        </button>

        <Link
          to="/register"
          className="block text-center text-blue-500 hover:underline"
        >
          Create Account
        </Link>
      </form>

    </div>
  );
}