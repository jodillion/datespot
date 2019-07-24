import React from 'react'
import { Link } from 'react-router-dom'

const LocationTile = props => {

  return(
    <div>
      <h5 className="box callout link"><Link to={`/locations/${props.id}`}>{props.name}</Link> <p className="rating">Rating: {props.rating}</p> </h5>
    </div>
  )
}

export default LocationTile
