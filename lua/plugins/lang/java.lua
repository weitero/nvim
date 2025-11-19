return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "java" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "jdtls" }, automatic_enable = { exclude = { "jdtls" } } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    opts = {
      -- The command that starts the language server
      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
      root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

      -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      settings = {
        java = {
          completion = { matchCase = "off" },
          -- Enable/disable the signature help,
          -- default is false
          signatureHelp = { enabled = true, description = { enabled = true } },
          codeGeneration = { generateComments = true },
          edit = { smartSemicolonDetection = { enabled = true } },
          saveActions = {
            -- Enable/disable auto organize imports on save action,
            -- default is false
            organizeImports = true,
          },
          -- Enable/disable the references code lens,
          -- default is true
          referencesCodeLens = { enabled = true },
          -- Enable/disable the implementations code lens,
          implementationCodeLens = "all",
          symbols = { includeSourceMethodDeclarations = true },
        },
      },

      -- Language server `initializationOptions`
      -- You need to extend the `bundles` with paths to jar files
      -- if you want to use additional eclipse.jdt.ls plugins.
      --
      -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
      --
      -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
      init_options = {
        -- https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
        bundles = {
          vim.fn.glob(
            vim.fn.stdpath("data") .. "/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar",
            true
          ),
        },
      },
    },
    config = function(_, opts)
      -- This starts a new client & server,
      -- or attaches to an existing client & server depending on the `root_dir`.
      require("jdtls").start_or_attach(opts)
      -- https://github.com/mfussenegger/nvim-jdtls#vscode-java-test-installation
      vim.list_extend(
        opts.init_options.bundles,
        vim.split(vim.fn.glob(vim.fn.stdpath("data") .. "/mason/share/java-test/*.jar", true), "\n")
      )

      -- `nvim-jdtls` provides some extras, for those you'll want to create additional mappings:
      vim.keymap.set("n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", { remap = false })
      vim.keymap.set("n", "crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { remap = false })
      vim.keymap.set("v", "crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { remap = false })
      vim.keymap.set("n", "crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", { remap = false })
      vim.keymap.set("v", "crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { remap = false })
      vim.keymap.set("v", "crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { remap = false })

      -- If using nvim-dap
      -- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
      vim.keymap.set("n", "<leader>tf", "<Cmd>lua require'jdtls'.test_class()<CR>", { remap = false })
      vim.keymap.set("n", "<leader>tn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", { remap = false })
    end,
  },
}
