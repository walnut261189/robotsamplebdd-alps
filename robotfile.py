from robot.api.deco import keyword

class RegistrationLibrary:

    @keyword
    def validate_email_format(self, email):
        """Validate email format using regex."""
        import re
        pattern = r"[^@]+@[^@]+\.[^@]+"
        return bool(re.match(pattern, email))
