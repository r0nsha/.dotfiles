return {
  {
    "goolord/alpha-nvim",
    config = function()
      local if_nil = vim.F.if_nil

      local leader = "SPC"

      ---@diagnostic disable-next-line: unused-local
      local header_comic_blush = {
        [[⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
        [[⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
        [[⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕]],
        [[⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕]],
        [[⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑]],
        [[⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐]],
        [[⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐]],
        [[⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔]],
        [[⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕]],
        [[⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕]],
        [[⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕]],
        [[⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕]],
        [[⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁]],
        [[⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿]],
      }

      ---@diagnostic disable-next-line: unused-local
      local header_pikachu = {
        [[          ▀████▀▄▄              ▄█ ]],
        [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
        [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
        [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
        [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
        [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
        [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
        [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
        [[   █   █  █      ▄▄           ▄▀   ]],
      }

      ---@diagnostic disable-next-line: unused-local
      local header_pixel_girl = {
        [[    ████▌█████▌█ ████████▐▀██▀    ]],
        [[  ▄█████ █████▌ █ ▀██████▌█▄▄▀▄   ]],
        [[  ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀  ]],
        [[ ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█      ]],
        [[   ███ ▌▄█▌  ▀  ▀██  ▀██████▌     ]],
        [[    ▀█▌▀██▀ ▄         ███▐███     ]],
        [[     ██▌             ▐███████▌    ]],
        [[     ███     ▀█▀     ▐██▐███▀▌    ]],
        [[     ▌█▌█▄         ▄▄████▀ ▀      ]],
        [[       █▀██▄▄▄ ▄▄▀▀▒█▀█           ]],
      }

      ---@diagnostic disable-next-line: unused-local
      local header_kanagawa_dark = {
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⣀⣀⣄⣤⣤⣤⣤⣠⣀⣀⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⠿⠿⠟⢛⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⡉⠀⠀⡀⠐⠀⠠⡈⡂⠢⢁⢉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⠁⠀⢁⠀⠀⠁⠠⢐⠠⡊⢂⠪⡠⠈⡌⠄⢄⡑⣝⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠄⠂⠁⡈⡢⢊⣆⡡⣘⢔⡥⣺⡤⡑⠔⠁⢅⠅⢅⠌⣜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⡀⠄⠀⡀⢅⢪⢰⣡⢯⡿⣧⣷⡽⣟⣿⣼⢈⠌⡂⠅⢂⢈⢉⠛⢉⢛⡛⡿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⢿⣗⣿⣽⣿⢻⢾⣿⢫⣾⣿⢫⣯⣶⡮⡪⢌⠰⢈⠆⡌⠰⢀⠳⠛⣛⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⠿⠉⠀⡀⠄⠂⠁⠀⠐⠀⠉⠾⠻⢞⣏⢾⣽⡳⣟⡿⣼⣿⡷⢻⢛⡅⣤⡑⢔⢑⢐⠑⠢⢈⢢⣶⣮⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀]],
        [[⠀⠀⠀⢠⣿⣟⢍⣍⠭⠃⠁⡀⠄⢀⢀⠀⢄⠂⠀⠂⠀⢄⠄⡈⢐⣰⢻⡯⣺⣿⢱⣿⣾⢱⣱⣿⣿⣿⣷⣢⡱⣷⡦⡈⢌⠊⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀]],
        [[⠀⠀⠀⢼⣿⠏⢈⠀⡀⡀⠂⠀⢠⠂⠂⠌⡢⠡⣀⠑⢀⠢⠑⠨⠠⡈⡉⠤⣱⠿⠽⢿⢇⢧⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢔⣗⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀]],
        [[⠀⠀⠀⣿⣿⠁⢀⢂⢂⠪⡨⢘⢢⡣⣢⡢⠂⠅⢆⠨⡐⢼⣬⢪⡴⡮⣀⠅⣂⢸⣬⣻⣗⢵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⠀⠀⠀]],
        [[⠀⠀⠀⣿⣿⡐⢌⠪⣐⠌⠔⡐⣙⢘⢟⣿⠄⡑⢈⠌⢀⠌⢛⢉⢽⡽⣾⢼⣰⡭⣷⣫⣷⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠀⠀⠀]],
        [[⠀⠀⠀⣿⣿⡢⡅⣧⡙⣿⣕⢷⢜⣮⢹⡽⠨⢨⣂⢮⢦⡊⢄⢡⢢⢷⣝⡯⣾⢞⡾⣞⣷⣷⢽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠀⠀⠀]],
        [[⠀⠀⠀⢿⣿⡇⢉⠡⢰⠐⡭⡽⣟⣿⣌⢞⢎⡞⣿⣌⢻⣞⣴⡝⣷⢯⣻⣞⠋⠀⠙⠙⡛⢿⣷⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀]],
        [[⠀⠀⠀⢸⣿⣿⠠⠨⠢⠂⠔⢔⡒⡝⣞⢷⣭⢻⢜⣞⢷⣜⠵⡿⣿⡻⠃⠁⠀⠀⠂⠁⠀⠀⢙⢷⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀]],
        [[⠀⠀⠀⠀⣿⣿⣷⡭⣦⡪⣾⢸⠵⡭⣢⢳⢸⢍⡳⢝⢗⢽⢻⠪⢉⠀⠐⠀⠁⡐⡠⠀⠠⠐⠀⢊⠙⠾⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⢉⠹⣿⣿⡟⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠘⣿⣿⣯⢷⣳⣟⣧⣕⢝⠮⣣⢗⠕⢎⠇⠎⠀⠀⡀⠀⡀⠄⠂⠔⢀⢂⠀⡀⢀⠀⢀⠡⢠⠠⠠⠙⢿⣿⣿⣿⣯⡻⡻⣩⣠⣌⢀⢤⣿⣿⠁⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠹⣿⣿⡝⠙⠛⠚⠉⡁⠁⢀⠁⠁⡁⠠⠀⠈⠀⢀⠀⠆⠠⡨⡨⠰⠀⢑⢈⠄⢌⡂⠄⠀⠌⢔⡁⢀⡉⠛⠛⠷⢿⢷⣦⣕⣯⣺⣿⣿⠃⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠙⣿⣿⣆⠄⠂⢀⢐⠈⡀⠀⠠⢈⢂⠁⠌⠈⢐⠁⡉⢂⠁⠀⡈⠌⡒⠈⣌⠢⡓⡌⡂⢌⠒⢼⣤⠘⣦⡑⢲⣐⠠⠐⠐⣨⣿⡿⠃⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣷⡜⡐⠠⠁⢴⡆⡡⢁⠀⡂⠅⢈⢀⠀⡐⢄⠕⢡⠐⠨⠐⡀⢫⢷⢣⣪⠨⡲⡡⡠⠙⠳⢽⢾⣧⡳⢷⣬⣾⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⢿⣿⣷⣣⡝⡞⡕⠌⡂⢂⠂⠅⠆⠄⡃⢐⢐⠘⣌⠤⢅⢑⠄⡀⠻⢯⢻⣳⢌⢞⢼⣙⢖⣔⢅⢏⢟⣷⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⣿⣿⣷⣔⣴⣕⣸⡾⡬⣐⠁⡢⠨⠂⠡⠈⢻⢼⣜⣖⠡⣐⠄⠙⠷⣝⣯⢷⣕⠬⡑⣎⣳⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣷⣿⣞⣿⣕⠀⡀⡂⢷⡔⡌⡰⡆⢪⡹⣺⣺⡦⢐⠠⢈⠙⠯⣯⣿⣷⣿⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠿⣿⣿⣷⣶⣮⣾⣆⣕⣈⣉⢔⣐⢌⢌⣚⣽⣿⣼⣶⣾⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠈⠛⠛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      }

      ---@diagnostic disable-next-line: unused-local
      local header_kanagawa_light = {
        [[          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣀⣀⣠⡤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀              ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⢶⣿⣿⢿⣯⣿⣟⢷⢽⣝⡾⡶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀             ]],
        [[      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣾⣿⡾⣿⣿⣾⣟⡯⣟⢵⡽⣕⢟⣷⢳⣻⡻⢮⠢⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[     ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣻⣽⣾⢷⢝⡵⠹⢞⠧⡫⢚⠅⢛⢮⣫⣾⡺⣺⡺⣳⠣⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[    ⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⢿⣻⣿⢿⡺⡕⡏⠞⡐⢀⠘⠈⢂⠠⠀⠃⡷⣳⢽⣺⡽⡷⡶⣤⡶⡤⢤⢀⠀⠀⠀⠀          ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⡀⠨⠀⠂⠀⡄⡁⠀⡔⠁⠀⡔⠐⠉⢑⢕⡳⣏⡷⣹⢳⣏⡿⣌⣤⠤⠀⠀⠀          ]],
        [[ ⠀⠀⠀⠀⠀⠀⣀⣶⣿⢿⣻⣽⣾⣿⣯⣿⣶⣁⣄⡡⠰⡁⠂⢌⠠⢀⠃⠀⢈⡄⡤⢺⠛⢮⡫⡮⡯⣮⣝⡷⡝⠉⠑⠀⠀          ]],
        [[⠀⠠⡲⠲⣒⣼⣾⢿⣻⡿⡿⣿⡻⣽⣿⣽⣿⡻⣻⢷⡯⠏⡄⢐⠅⠀⡎⠀⠁⡎⠎⠀⠀⠀⠈⠝⢎⠈⢙⢷⡳⣵⠠⠀⠀⠀          ]],
        [[⠀⣰⡷⣿⢿⢿⣽⣿⡟⣽⣽⣳⢝⣞⠿⣮⡿⣝⣮⣗⣟⢷⢶⣛⠎⣀⣂⡀⡸⡘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡫⠨⠀⠀⠀⠀          ]],
        [[⠀⣾⡿⡽⡽⣕⢗⡧⡝⢜⠝⢝⣽⣺⡹⣗⢯⡃⠓⡕⢋⢑⠿⣺⠽⡇⠓⠄⠨⡊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[⠀⢯⡳⣕⠯⣳⣫⢯⠦⡧⡠⠀⣻⢮⡷⣳⡿⣳⡤⡶⡂⢂⠁⡃⠏⢒⠈⠔⠈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[⠀⢝⢺⠘⢦⠀⠪⡈⡣⠑⡆⢂⣗⡗⠽⡑⡙⢵⡻⡞⡝⡈⠢⢐⠁⡡⢁⠡⠈⠈⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[⠀⢸⡶⣞⡏⣯⢒⢂⠠⠀⠳⡡⡱⢡⠀⠳⡄⠡⠋⢢⠈⡐⠄⠡⣴⣿⣦⣦⢤⡀⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[⠀⠀⣟⣗⣝⣽⣫⡫⢭⢢⠡⡈⠒⡄⡣⠡⡈⠣⣊⢀⠀⢄⣼⣾⣿⣿⣽⣾⣿⣿⡦⡈⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[⠀⠀⠈⢒⠙⢕⠁⡇⣊⢒⠝⡌⡇⡲⢌⡢⡨⡂⡄⣕⡶⣿⣯⣿⣾⢯⢟⣿⣟⣯⣿⡵⣦⣁⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡶⣆⠀      ]],
        [[ ⠀⠀⠐⡈⠌⠠⠘⠪⡢⣑⠜⡨⣪⡱⣸⣱⣿⣿⢿⣿⢿⣻⣽⣫⡿⡽⣿⢿⡿⣿⡿⣞⡟⣟⣟⣦⡀⠀⠀⠀⠐⢄⢄⠖⠟⠳⡿⡛⠀      ]],
        [[  ⠀⠀⢢⣦⣤⣥⣶⢾⣾⡿⣾⣾⢾⣟⣿⣷⣿⡿⣿⣹⣟⢗⢗⣏⣿⡮⡷⣻⡳⢽⣻⣿⣳⡫⢾⡿⢶⣤⣤⣈⡀⡈⠙⠪⠐⠅⠀⠀      ]],
        [[   ⠀⠀⠹⣻⣽⡿⡯⣷⢿⣿⣟⡷⡽⣾⣳⣷⡯⣾⢶⡽⣾⣿⢷⣳⢭⣷⠳⣝⢬⢳⢽⡳⣭⡃⠛⣧⠙⢮⡍⠯⣟⣯⣯⠗         ]],
        [[     ⠀⠈⢣⢯⣟⣾⡋⢹⢞⡾⣿⢽⣺⡷⡿⣿⢯⡻⣪⡞⣯⣗⣯⢿⡔⡈⡜⠕⣗⢍⢞⢟⣦⣌⡂⡁⠘⢌⡈⠓⠁⠀         ]],
        [[       ⠀⠈⠜⢢⢡⢪⣳⢽⡽⣽⣺⣹⣻⢼⡯⡯⣧⠳⣛⡺⡮⣻⢿⣄⡐⡄⠌⡳⡡⡃⠦⡩⠫⡺⡰⡠⠈            ]],
        [[        ⠀⠀⠈⠫⠋⠪⠇⢁⢓⠯⣾⢝⣗⣽⣞⣷⡄⡃⠣⠩⣞⠯⣻⣦⣈⠢⠐⡈⠪⣓⢮⠱⠌               ]],
        [[           ⠀⠀⠈⠀⠡⠀⠪⣿⢿⢽⡈⢫⢳⢏⢹⡕⢆⠅⠅⢙⡯⣟⡷⣦⣐⠐⠀⠈                 ]],
        [[               ⠀⠀⠈⠉⠑⠁⠹⠪⠷⠶⡫⠯⡳⡳⠥⠂⠀⠃⠉⠁⠀⠀                   ]],
      }

      local headers = { header_comic_blush, header_pikachu, header_pixel_girl }

      math.randomseed(os.time())
      local chosen_header = headers[math.random(#headers)]

      local header = {
        type = "text",
        val = chosen_header,
        opts = {
          position = "center",
          hl = "@type",
        },
      }

      local function button(sc, txt, keybind, keybind_opts)
        local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

        local opts = {
          position = "center",
          shortcut = sc,
          cursor = 6,
          width = 40,
          align_shortcut = "right",
          hl_shortcut = "@type",
        }

        if keybind then
          keybind_opts = if_nil(keybind_opts, { remap = false, silent = true, nowait = true })
          opts.keymap = { "n", sc_, keybind, keybind_opts }
        end

        local function on_press()
          local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
          vim.api.nvim_feedkeys(key, "t", false)
        end

        return {
          type = "button",
          val = txt,
          on_press = on_press,
          opts = opts,
        }
      end

      local main_group = {
        type = "group",
        val = {
          button("e", "󰈔  New", "<cmd>ene <bar> startinsert <cr>", {}),
          button(
            "p",
            "󰂺  Projects",
            "<cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<cr>",
            {}
          ),
          button("r", "󰋚  Recents", "<cmd>lua require'telescope.builtin'.oldfiles{}<cr>", {}),
        },
        opts = {
          spacing = 1,
        },
      }

      local tools_group = {
        type = "group",
        val = {
          button("L", "󰚥  Lazy", "<cmd>Lazy<cr>", {}),
          button("M", "󱊈  Mason", "<cmd>Mason<cr>", {}),
        },
        opts = {
          spacing = 1,
        },
      }

      local footer = {
        type = "text",
        val = function()
          local lazy_stats = require("lazy").stats()
          return "󱐋 loaded "
              .. lazy_stats.loaded
              .. "/"
              .. lazy_stats.count
              .. " plugins in "
              .. string.format("%.2f", lazy_stats.startuptime)
              .. "ms"
        end,
        opts = {
          position = "center",
          hl = "DiagnosticWarn",
        },
      }

      local config = {
        layout = {
          { type = "padding", val = math.max(7, math.floor(#chosen_header * 0.6)) },
          header,
          { type = "padding", val = math.floor(#chosen_header * 0.4) },
          main_group,
          { type = "padding", val = 1 },
          tools_group,
          { type = "padding", val = 4 },
          footer,
        },
        opts = {
          margin = 5,
        },
      }

      require("alpha").setup(config)
    end,
  },
}
