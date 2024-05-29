require("neo-tree").setup(
{
  window = {
    mappings = {
      -- upload (sync files)
      uu = {
        function(state)
          vim.cmd("TransferUpload " .. state.tree:get_node().path)
        end,
        desc = "upload file or directory",
        nowait = true,
      },
      -- download (sync files)
      ud = {
        function(state)
          vim.cmd("TransferDownload" .. state.tree:get_node().path)
        end,
        desc = "download file or directory",
        nowait = true,
      },
      -- diff directory with remote
      uf = {
        function(state)
          local node = state.tree:get_node()
          local context_dir = node.path
          if node.type ~= "directory" then
            -- if not a directory
            -- one level up
            context_dir = context_dir:gsub("/[^/]*$", "")
          end
          vim.cmd("TransferDirDiff " .. context_dir)
          vim.cmd("Neotree close")
        end,
        desc = "diff with remote",
      },
    },
  },
}
)
