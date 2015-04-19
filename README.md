Heroku app name: pure-stream-1780

students don't have to be deleteable, but they should:
- be shown to be 'active' or 'inactive' (set by the Admin)
- when inactive, the user can't access anything (except be able to (only) delete (not edit) their Testimonial)
- Students who aren't assigned to classes should be flagged (then admin can check if they should be made inactive). When a class is deleted, it may be the case that a student's student.groups becomes 'nil' automatically - this could automatically set them to have the status of having no class.