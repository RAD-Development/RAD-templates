{
  description = "Commonly used templates by the RAD-Development team";

  outputs =
    { self }:
    {

      # Utilized by `nix flake init -t <flake>`
      defaultTemplate = self.templates.poetry;

      # Utilized by `nix flake init -t <flake>#<name>`
      templates = {
        poetry = {
          path = ./poetry;
          description = "A poetry-based python project, using poetry2nix";
        };
      };
    };
}
