import {
  Routes,
  Route,
  Navigate,
} from "react-router-dom";

import LoginPage
from "../features/auth/LoginPage";

import RegisterPage
from "../features/auth/RegisterPage";

import TodoPage
from "../features/todo/TodoPage";

import ProtectedRoute
from "./ProtectedRoute";

import MainLayout
from "../components/layouts/MainLayout";

export default function AppRoutes() {

  return (

    <Routes>

      <Route
        path="/"
        element={
          <Navigate to="/login" />
        }
      />

      <Route
        path="/login"
        element={<LoginPage />}
      />

      <Route
        path="/register"
        element={<RegisterPage />}
      />

      <Route
        path="/todos"
        element={
          <ProtectedRoute>

            <MainLayout>

              <TodoPage />

            </MainLayout>

          </ProtectedRoute>
        }
      />

    </Routes>
  );
}