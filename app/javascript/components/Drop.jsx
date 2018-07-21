import React from "react"
import PropTypes from "prop-types"

import Dropzone from 'react-dropzone'


const fileReader = (file, responseFunc )=> {

    console.log("33 ")

    const reader = new FileReader();
    console.log("44 ")
    reader.onload = () => {
        console.log("CH 55: ")
        const fileAsBinaryString = reader.result;
        // do whatever you want with the file content

        console.log("CH 22: ")

        fetch('/static/droper', { // Your POST endpoint
            method: 'POST',
            headers: {
                // 'Content-Type': 'application/json'

            },
            body: fileAsBinaryString // This is your file object
        }).then(
            response => response.json() // if the response is a JSON object
        ).then(
            jsonRersponse => responseFunc(jsonRersponse) // Handle the success response object
        ).catch(
            error => console.log("CH2 " + error) // Handle the error response object
        );
    };
    reader.onabort = () => console.log('file reading was aborted');
    reader.onerror = () => console.log('file reading has failed');

    reader.readAsText(file)
}


export default class Drop extends React.Component {

    constructor(props){

        super(props)
        this.state = {
            words: []
        }

        this.onDropSuccess = this.onDropSuccess.bind(this)
        this.onDrop = this.onDrop.bind(this)
    }

    onDropSuccess(jsonResponse){

        console.log(jsonResponse[0])

        this.setState({
            words: jsonResponse
        })
    }

    onDrop(files, event) {

        fileReader(files[0], this.onDropSuccess)
    }

    render () {

        const myblock = this.state.words.map(function (w) {
            return <h2>{w}</h2>
        })

    return (
        <form className='join-form' ref='joinForm' autoComplete='off'>
            <Dropzone
                onDrop={this.onDrop}
                className='dropzone'
                activeClassName='active-dropzone'
                multiple={false}>
                <div class="drop-box">Drag and drop or click to upload a docx file.</div>
            </Dropzone>

            {this.state.words.length > 0 ?
                <p>{myblock}</p> : <h2>Nothing yet</h2>}
        </form>
    );
    }
}

