import api from "./axios";

export const loginApi = (data: unknown) =>
  api.post("/auth/login", data);

export const registerApi = (data: unknown) =>
  api.post("/auth/register", data);