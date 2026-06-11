import { useEffect } from "react";

import {
  fetchTodos,
} from "./todoSlice";

import { deleteTodoApi }
from "../../api/todoApi";

import {
  useAppDispatch
} from "../../hooks/useAppDispatch";

import {
  useAppSelector
} from "../../hooks/useAppSelector";

export default function TodoList() {

  const dispatch =
    useAppDispatch();

  const todos =
    useAppSelector(
      (state: any) => state.todo.todos
    );

  useEffect(() => {

    dispatch(fetchTodos());

  }, [dispatch]);

  const deleteTodo =
    async (id: number) => {

      await deleteTodoApi(id);

      dispatch(fetchTodos());
    };
    console.log("todos =", todos);

  return (
    <div className="space-y-4">

      {todos.map((todo: any) => (

        <div
          key={todo.id}
          className="border p-4 rounded"
        >

          <h3 className="font-bold">
            {todo.title}
          </h3>

          <p>
            {todo.description}
          </p>

          <button
            onClick={() =>
              deleteTodo(todo.id)
            }
            className="mt-2 bg-red-500 text-white px-3 py-1 rounded"
          >
            Delete
          </button>

        </div>

      ))}

    </div>
  );
}