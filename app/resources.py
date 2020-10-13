from app import api, db
from app.models import Song, Author
from flask_restful import Resource, reqparse, abort
from app.output_schema import SongSchema, AuthorSchema

songs_schema = SongSchema(many=True)
song_schema = SongSchema()
authors_schema = AuthorSchema(many=True)
author_schema = AuthorSchema()


class Songs(Resource):
    def get(self):
        songs = Song.query.all()

        return songs_schema.dump(songs)

    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('name', type=str, required=True)
        parser.add_argument('author', type=str, required=True)

        data = parser.parse_args(strict=True)
        author = Author.query.filter(Author.name == data['author']).first()
        if not author:
            abort(
                404, message="Author {} does not exist".format(data['author'])
            )
        new_song = Song(name=data['name'], author=author)
        db.session.add(new_song)
        db.session.commit()

        return song_schema.dump(new_song), 201


class Authors(Resource):
    def get(self):
        authors = Author.query.all()

        return authors_schema.dump(authors)

    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('name', type=str, required=True)

        data = parser.parse_args(strict=True)
        new_author = Author(name=data['name'])
        db.session.add(new_author)
        db.session.commit()

        return author_schema.dump(new_author), 201


api.add_resource(Songs, '/songs')
api.add_resource(Authors, '/authors')
