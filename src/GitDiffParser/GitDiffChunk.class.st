Class {
	#name : #GitDiffChunk,
	#superclass : #Object,
	#instVars : [
		'header',
		'lines'
	],
	#category : #GitDiffParser
}

{ #category : #gui }
GitDiffChunk >> gtTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>
	
	composite tree
		title: 'Tree';
		children: #lines;
		format: #header;
		shouldExpandToLevel: 6
]

{ #category : #accessing }
GitDiffChunk >> header [
	^ header
]

{ #category : #accessing }
GitDiffChunk >> header: anObject [
	header := anObject
]

{ #category : #accessing }
GitDiffChunk >> lines [
	^ lines
]

{ #category : #accessing }
GitDiffChunk >> lines: anObject [
	lines := anObject
]
