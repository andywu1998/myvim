return {
    {
        "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<S-c>", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    },
  }
}
