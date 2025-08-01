{
  programs.bacon = {
    enable = true;
    settings = {
      jobs.bacon-ls = {
        command = [
          "cargo"
          "clippy"
          "--workspace"
          "--all-targets"
          "--all-features"
          "--message-format"
          "json-diagnostic-rendered-ansi"
        ];
        analyzer = "cargo_json";
        need_stdout = true;
      };
      exports.cargo-json-spans = {
        auto = true;
        exporter = "analyzer";
        line_format = ''{diagnostic.level}|:|{span.file_name}|:|{span.line_start}|:|{span.line_end}|:|{span.column_start}|:|{span.column_end}|:|{diagnostic.message}|:|{diagnostic.rendered}|:|{span.suggested_replacement}'';
        path = ".bacon-locations";
      };
    };
  };
}
