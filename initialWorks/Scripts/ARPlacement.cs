using System.Collections;

using System.Collections.Generic;

using UnityEngine;

using UnityEngine.XR.ARFoundation;

using UnityEngine.XR.ARSubsystems;


public class ARPlacement : MonoBehaviour

{


    public GameObject arObjectToSpawn;

    public GameObject placementIndicator;

    private GameObject spawnedObject;

    private Pose PlacementPose;

    private ARRaycastManager aRRaycastManager;

    private bool placementPoseIsValid = false;


    void Start()

    {

        aRRaycastManager = FindObjectOfType<ARRaycastManager>();

    }


    // need to update placement indicator, placement pose and spawn

    void Update()

    {

        if(spawnedObject == null && placementPoseIsValid && Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began)

        {

            ARPlaceObject();

        }



        UpdatePlacementPose();

        UpdatePlacementIndicator();



    }

    void UpdatePlacementIndicator()

    {

        if(spawnedObject == null && placementPoseIsValid)

        {

            placementIndicator.SetActive(true);

            placementIndicator.transform.SetPositionAndRotation(PlacementPose.position, PlacementPose.rotation);

        }

        else

        {

            placementIndicator.SetActive(false);

        }

    }


    void UpdatePlacementPose()

    {

        var screenCenter = Camera.current.ViewportToScreenPoint(new Vector3(0.5f, 0.5f));



        var hits = new List<ARRaycastHit>();

        aRRaycastManager.Raycast(screenCenter, hits, TrackableType.Planes);


        placementPoseIsValid = hits.Count > 0;

        if(placementPoseIsValid)

        {

            PlacementPose = hits[0].pose;

        }

    }


    void ARPlaceObject()

    {

        spawnedObject = Instantiate(arObjectToSpawn, PlacementPose.position, PlacementPose.rotation);

    }



}

/*

using System.Runtime.CompilerServices;
using System.Linq.Expressions;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;
using UnityEngine.EventSystems;
using UnityEngine.XR.ARSubsystems;

public class PlaceOnPlane : MonoBehaviour
{
    private ARRaycastManager        raycastManager;
    List<ARRaycastHit>              hits;

    public Camera                   m_MainCamera;
    public GameObject               placementIndicator;

    // Start is called before the first frame update
    void Start()
    {
        raycastManager = GetComponent<ARRaycastManager>();
        hits = new List<ARRaycastHit>();
    }

    // Update is called once per frame
    void Update()
    {
        if( !m_MainCamera.enabled ){
            UnityEngine.Debug.Log("Camera is not enabled, returning");
            return;
        }

        var screenCenter = m_MainCamera.ViewportToScreenPoint(new Vector3(0.5f, 0.5f));
        UnityEngine.Debug.Log("ViewportToScreenPoint converted");

        if( !raycastManager.Raycast(screenCenter, hits) ){
            UnityEngine.Debug.Log("Raycast manager failed");
        }

        placementIndicator.SetActive(true);
        Pose pose = hits[0].pose;
        UnityEngine.Debug.Log("Set the marker position now");
        placementIndicator.transform.SetPositionAndRotation(pose.position, pose.rotation);
        UnityEngine.Debug.Log("Marker position set");        
    }
}
*/
