import { useState } from "react";
import { useAppDispatch } from "../../hooks/useAppDispatch";
import {
  createTodo,
  fetchTodos,
} from "./todoSlice";

export default function TodoForm() {

  const dispatch = useAppDispatch();

  const [title, setTitle] =
    useState("");

  const [description, setDescription] =
    useState("");

  const submit = async (
    e: React.FormEvent
  ) => {

    e.preventDefault();

    await dispatch(
      createTodo({
        title,
        description,
      })
    );

    dispatch(fetchTodos());

    setTitle("");
    setDescription("");
  };

  return (
    <form
      onSubmit={submit}
      className="space-y-3 mb-8"
    >

      <input
        className="border p-2 w-full"
        placeholder="Title"
        value={title}
        onChange={(e) =>
          setTitle(e.target.value)
        }
      />

      <textarea
        className="border p-2 w-full"
        placeholder="Description"
        value={description}
        onChange={(e) =>
          setDescription(e.target.value)
        }
      />

      <button
        className="bg-green-600 text-white p-2 rounded"
      >
        Add Todo
      </button>

    </form>
  );
}