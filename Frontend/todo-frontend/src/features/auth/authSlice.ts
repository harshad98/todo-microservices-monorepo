import {
  createAsyncThunk,
  createSlice,
} from "@reduxjs/toolkit";

import { loginApi } from "../../api/authApi";

export const loginUser = createAsyncThunk(
  "auth/login",
  async (credentials: {
    username: string;
    password: string;
  }) => {
    const response =
      await loginApi(credentials);

    localStorage.setItem(
      "token",
      response.data.token
    );

    return response.data;
  }
);

const authSlice = createSlice({
  name: "auth",

  initialState: {
    user: null,
    loading: false,
  },

  reducers: {
    logout: (state) => {
      localStorage.removeItem("token");
      state.user = null;
    },
  },

  extraReducers: (builder) => {
    builder.addCase(
      loginUser.fulfilled,
      (state, action) => {
        state.user = action.payload;
      }
    );
  },
});

export const { logout } =
  authSlice.actions;

export default authSlice.reducer;