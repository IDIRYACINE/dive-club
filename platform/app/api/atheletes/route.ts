import { FirebaseServicesProvider } from '@/infrastracture';
import { AtheletesServicePort } from '@/infrastracture/atheletesService/port';
import { NextResponse } from 'next/server';


const atheleteService: AtheletesServicePort = FirebaseServicesProvider.create().getAtheletesService()

export async function GET(req: Request) {

    const { searchParams } = new URL(req.url);

    const clubId = searchParams.get('clubId')!;

    const response = await atheleteService.getAtheletes({
        clubId: (clubId as string)
    })


    return NextResponse.json({ data: response })
}


export async function POST(req: Request) {

    const options = await req.json();

    const response = await atheleteService.addAthelete(options);

    return NextResponse.json({ data: response });
}


export async function PUT(req: Request) {
    const options = await req.json();

    const response = await atheleteService.updateAthelete(options);

    return NextResponse.json({ data: response });
}

export async function DELETE(req: Request) {
    const { searchParams } = new URL(req.url);

    const clubId = searchParams.get('clubId')!;
    const atheleteId = searchParams.get('atheleteId')!;



    const response = await atheleteService.deleteAthelete({
        clubId: (clubId as string), atheleteId: (atheleteId as string)
    });

    return NextResponse.json({ data: response });
}