package siga

class BlogControllerController {

    def blog = {
		[postList:Post.list()]
	}
}
