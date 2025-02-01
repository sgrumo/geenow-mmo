defmodule GeenowWeb.AuthControllerTest do
  use GeenowWeb.ConnCase

  alias Geenow.Accounts
  alias Geenow.Accounts.User

  @valid_signup_attrs %{
    email: "geenow@gmail.com",
    password_hash: "mamminabella",
    username: "Geenow"
  }
  @valid_signin_attrs %{
    email: "geenow@gmail.com",
    password: "mamminabella"
  }

  @invalid_signin_attrs %{
    email: "invalid_email",
    password: "short"
  }

  describe "signup" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/auth/signup", @valid_signup_attrs)
      assert %{"token" => _token} = json_response(conn, :created)
      assert %{"email" => "geenow@gmail.com"} = json_response(conn, :created)
    end

    #    test "renders errors when data is invalid", %{conn: conn} do
    #      conn = post(conn, ~p"/auth/signup", user: @invalid_attrs)
    #      assert json_response(conn, :unprocessable_entity)["status"] == "error"
    #    end

    #    test "renders error when email is already taken", %{conn: conn} do
    #      # First create a user
    #      {:ok, _user} = Accounts.create_user(@valid_attrs)
    #
    #      # Try to create another user with same email
    #      conn = post(conn, ~p"/auth/signup", user: @valid_attrs)
    #      assert json_response(conn, :unprocessable_entity)["status"] == "error"
    #
    #      assert %{"email" => ["has already been taken"]} =
    #               json_response(conn, :unprocessable_entity)["errors"]
    #    end
  end

  describe "signin" do
    setup %{conn: conn} do
      {:ok, user} = Accounts.create_user(@valid_signup_attrs)
      {:ok, conn: conn, user: user}
    end

    test "renders token when credentials are valid", %{conn: conn} do
      conn =
        post(conn, ~p"/auth/signin", %{
          email: @valid_signin_attrs.email,
          password: @valid_signin_attrs.password
        })

      assert %{"token" => _token} = json_response(conn, :ok)
      assert %{"email" => "geenow@gmail.com"} = json_response(conn, :ok)
    end
  end

  #
  #    test "renders error when email is invalid", %{conn: conn} do
  #      conn =
  #        post(conn, ~p"/auth/signin", %{
  #          email: "wrong@example.com",
  #          password: @valid_attrs.password
  #        })
  #
  #      assert json_response(conn, :unauthorized)["status"] == "error"
  #      assert json_response(conn, :unauthorized)["message"] == "Invalid email or password"
  #    end
  #
  #    test "renders error when password is invalid", %{conn: conn} do
  #      conn =
  #        post(conn, ~p"/auth/signin", %{
  #          email: @valid_attrs.email,
  #          password: "wrongpassword"
  #        })
  #
  #      assert json_response(conn, :unauthorized)["status"] == "error"
  #      assert json_response(conn, :unauthorized)["message"] == "Invalid email or password"
  #    end
  #  end
end
