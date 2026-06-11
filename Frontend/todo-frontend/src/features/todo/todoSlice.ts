import {
  createAsyncThunk,
  createSlice,
} from "@reduxjs/toolkit";

import {
  getTodosApi,
  createTodoApi,
} from "../../api/todoApi";

export const fetchTodos =
  createAsyncThunk(
    "todo/fetch",
    async () => {
      const response =
        await getTodosApi();

      return response.data;
    }
  );

export const createTodo =
  createAsyncThunk(
    "todo/create",
    async (todo: {
      title: string;
      description: string;
    }) => {
      const response =
        await createTodoApi(todo);

      return response.data;
    }
  );

const todoSlice = createSlice({
  name: "todo",

  initialState: {
    todos: [],
  },

  reducers: {},

  extraReducers: (builder) => {
    builder.addCase(
      fetchTodos.fulfilled,
      (state, action) => {
        state.todos = action.payload;
      }
    );
  },
});

export default todoSlice.reducer;