// Copyright 2025 Lovell Fuller
// SPDX-License-Identifier: BSD-3-Clause

const { join } = require("node:path");

const command = join(__dirname, "bin", "cpplint-cpp");

module.exports = { command };
