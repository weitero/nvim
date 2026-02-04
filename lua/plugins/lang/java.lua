return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "java",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "jdtls",
      },
      automatic_enable = {
        exclude = {
          "jdtls",
        },
      },
    },
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = {
      "java",
    },
    opts = {
      -- The command that starts the language server
      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
      root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

      -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      settings = {
        java = {
          cleanup = {
            actionsOnSave = {
              "addDeprecated",
              "addOverride",
              "instanceofPatternMatch",
              "invertEquals",
              "lambdaExpression",
              "lambdaExpressionFromAnonymousClass",
              "organizeImports",
              "qualifyMembers",
              "qualifyStaticMembers",
              "redundantComparisonStatement",
              "redundantFallingThroughBlockEnd",
              "redundantIfCondition",
              "redundantModifiers",
              "redundantSuperCall",
              "renameFileToType",
              "renameUnusedLocalVariables",
              "stringConcatToTextBlock",
              "switchExpression",
              "tryWithResource",
              "useSwitchForInstanceofPattern",
            },
          },
          codeGeneration = { generateComments = true },
          completion = { matchCase = false },
          edit = { smartSemicolonDetection = { enabled = true } },
          implementationCodeLens = "all",
          referencesCodeLens = { enabled = true },
          saveActions = { organizeImports = true },
          signatureHelp = { description = { enabled = true } },
          telemetry = { enabled = false },
        },
      },
    },
    config = function(_, opts)
      -- This starts a new client & server,
      -- or attaches to an existing client & server depending on the `root_dir`.
      require("jdtls").start_or_attach(opts)

      -- `nvim-jdtls` provides some extras, for those you'll want to create additional mappings:
      vim.keymap.set("n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", { remap = false })
      vim.keymap.set("n", "crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { remap = false })
      vim.keymap.set("v", "crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { remap = false })
      vim.keymap.set("n", "crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", { remap = false })
      vim.keymap.set("v", "crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { remap = false })
      vim.keymap.set("v", "crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { remap = false })
    end,
  },
}
