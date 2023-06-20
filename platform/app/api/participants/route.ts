import { FirebaseServicesProvider } from '@/infrastracture';
import { ParticipantsServicePort } from '@/infrastracture/participantsService/port';
import { NextApiRequest, NextApiResponse } from 'next'
import { NextResponse } from 'next/server';

const participantService: ParticipantsServicePort = FirebaseServicesProvider.create().getParticipationsService()

export async function GET(req: Request) {

    const { searchParams } = new URL(req.url);

    const clubId = searchParams.get('clubId')!;



    const response = await participantService.getParticipants({
        clubId: (clubId as string)
    })


    return NextResponse.json({ data: response });
}


export async function POST(req: Request) {

    const options = await req.json();

    const response = await participantService.addParticipant(options);

    return NextResponse.json({ data: response });
}


export async function PUT(req: Request) {
    const options = await req.json();


    const response = await participantService.updateParticipant(options);

    return NextResponse.json({ data: response });
}

export async function DELETE(req: Request) {
    const { searchParams } = new URL(req.url);

    const clubId = searchParams.get('clubId')!;
    const participantId = searchParams.get('participantId')!;


    const response = await participantService.deleteParticipant({
        clubId: (clubId as string), participantId: (participantId as string)
    });

    return NextResponse.json({ data: response });
}