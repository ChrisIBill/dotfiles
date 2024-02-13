return {

  {
    "jmederosalvarado/roslyn.nvim",

    dotnet_cmd = "dotnet",
    roslyn_version = "latest",
    on_attach = function(client, bufnr)
      require("lazyvim.util").lsp.on_attach(client)
      require("lazyvim.util").lsp.on_attach(function(client)
        if client.name == "roslyn" then
          require("roslyn").setup_buffer(client, bufnr)
        end
      end)
    end,
  },
}
